# Memoria ya no es seniority: criterio arquitectónico + orquestación > recordar APIs

Estado: Borrador v1
Ángulo: 1 (fin del “experto memorioso” en desarrollo backend)
Contexto autor: backend senior en transición (desempleado, actualizando stack y explorando oportunidades / emprendimiento).

---
## Hook
Si tu ventaja competitiva es recordar métodos de librerías, ya perdiste contra la pestaña abierta con un LLM.

## Problema
Durante años se asoció “seniority” a: 1) amplitud de frameworks conocidos, 2) memoria de patrones / atajos, 3) velocidad escribiendo código manual. En 2025 un LLM + buena documentación cubren (1) y (2) a bajo costo. Muchos seniors quedan desnudos: su diferenciador era saber cosas, no decidir mejor.

Síntomas que veo:
- PRs largos con decisiones implícitas no justificadas.
- Dependencia de memoria tribal para migraciones / refactors.
- Entrevistas todavía preguntan trivia de bajo impacto.

## Cambio estructural
La asimetría de información colapsó: cualquiera con buen prompt obtiene esqueletos de servicios, snippets optimizados o comparativas de librerías en minutos. La escasez se mueve a: formular el problema, acotar el contexto relevante, establecer criterios de aceptación, elegir compromisos técnicos, diseñar experimentos de validación y auditar outputs.

## Nueva definición operativa de seniority
Seniority = (Calidad de decisiones arquitectónicas * Velocidad de validación) / Riesgo no detectado.
Memoria puntual ≈ commodity.

## Mini‑framework: CAPA
1. Contexto: delimita límites (dominio, SLAs, regulaciones, latencias target, presupuesto).  
2. Alternativas: fuerza al menos 3 opciones (A actual, B incremental, C radical) con tabla de trade‑offs (latencia, throughput, costo, complejidad cognitiva, reversibilidad).  
3. Pruebas: micro‑POC o benchmark dirigido (input sintético, dataset representativo, caso peor).  
4. Auditoría: checklist de aceptación (funcional, rendimiento, seguridad, observabilidad, deuda asumida explícita).

## Ejemplo concreto (microservicio de facturación)
Necesidad: recalcular impuestos en lote sin bloquear requests interactivos.
- Contexto: volumen pico 120k facturas/hora, SLA de API existente P95 < 250ms, ventana batch nocturna 3h.
- Alternativas: 
  - A) Cron + job monolítico (rápido, un único punto de fallo, difícil escalar incremental).
  - B) Cola + workers idempotentes (latencia controlada, escalado horizontal, mayor complejidad operativa).
  - C) Event sourcing parcial (flexibilidad histórica, mayor costo cognitivo inicial, reversibilidad baja).
- Pruebas (B): generar dataset de 1M facturas con distribución realista, medir throughput y coste unitario en entorno aislado, inyectar fallos de red 2%.
- Auditoría: ¿Se registran offsets? ¿Idempotencia validada? ¿Alarmas en DLQ < 50 mensajes? ¿Coste mensual simulado < X? Documentar deuda: no hay re‑proceso histórico anterior a 2023.

## Checklist rápido para tu próxima decisión
- [ ] Escribí el problema en formato Entrada → Proceso → Salida + restricciones (latencia, coste, confidencialidad, compliance).
- [ ] Listé 3 alternativas (incluyendo “no hacer nada ahora”).
- [ ] Marqué en una tabla 5 métricas clave y la reversibilidad (baja / media / alta).
- [ ] Pedí al LLM: “Evalúa sesgos / riesgos omitidos” + revisé manualmente.
- [ ] Construí micro‑benchmark < 4h o script de carga (no esperé sprint entero).
- [ ] Formalicé criterios de aceptación y debt explícita.
- [ ] Guardé el artefacto (context pack) en repo /docs con fecha.

## Métricas que puedes empezar a trackear (para narrar valor en entrevistas)
- Tiempo a Primera Hipótesis Técnica (T1HT): desde ticket crudo hasta 3 alternativas comparadas. Meta: < 90 min para problemas medianos.
- Ratio Decisiones Documentadas / Decisiones Relevantes (> X impacto). Meta: ≥ 0.8.
- Reversibilidad Promedio (clasificación simple). Meta: mover 10% de decisiones de baja reversibilidad a media/alta mediante encapsulación.
- Lead time de micro‑POC: idea → benchmark ejecutado. Meta: < 1 día.

## Cómo usar LLM de forma madura (sin delegar juicio)
- Generar alternativas estructuradas (pide tabla trade‑offs, especifica columnas).
- Pedir contraejemplos: “¿Cuándo este enfoque fallaría gravemente?”
- Generar harness de prueba base (fixture + dataset sintético) y luego tú enriqueces.
- Revisar invariantes (“Enumera invariantes de consistencia que debo proteger”).
- Red team ligero: pedirle que rompa tu diseño (“Propón maneras en que este diseño se degrada con crecimiento 10x”).

## Límites (anti‑hype)
No delegues totalmente: lógica financiera crítica, migraciones irreversibles, decisiones de licenciamiento, esquemas de concurrencia compleja y capas criptográficas. Aquí la memoria de precedentes y contexto histórico de la organización sí importan.

## Errores frecuentes que te restan valor ahora
- Confundir velocidad de autocompletado con throughput entregado.
- Aceptar la primera arquitectura “correcta” sin generar comparativa.
- No medir reversibilidad: terminas atado a vendor lock‑in invisible.
- Subestimar coste cognitivo de introducir otra pieza distribuida.
- No versionar los prompts/contextos que sustentan decisiones.

## CTA (elige 1 al publicar)
1. ¿Qué métrica usas hoy para evidenciar que tus decisiones son mejores que “lo primero que salió”? Coméntala y te comparto una plantilla de trade‑offs.
2. Si quieres la hoja de cálculo CAPA + tabla de reversibilidad, comenta “CAPA”.
3. Dame un caso donde memoria pura te salvó (y la IA no habría bastado) para incluirlo en la versión 2.

## Posible hilo futuro (si engancha)
Parte 2: Orquestador de contexto (cómo estructuro “context packs” versionados). Parte 3: Métrica T1H y su instrumentación.

---
Notas personales (no publicar): Ajustar métricas con ejemplos reales de experiencia previa (facturación lote, migración colas → streaming, reducción latencia endpoint pricing). Añadir números concretos una vez verificados.
