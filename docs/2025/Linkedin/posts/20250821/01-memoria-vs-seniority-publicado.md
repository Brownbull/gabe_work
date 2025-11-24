Memoria ya no es seniority.

Si tu ventaja es recordar métodos de librerías, ya perdiste contra una pestaña con un LLM.

Durante años confundimos seniority con:
- Acumular frameworks y patrones en la cabeza.
- Velocidad escribiendo código “de memoria”.
- Tener respuestas instantáneas en una pizarra.

Eso hoy es commodity: cualquier dev con buen prompt obtiene un esqueleto de servicio + tabla de comparaciones en minutos.
La escasez se movió a otra parte: formular mejor el problema, explicitar trade‑offs, diseñar pruebas pequeñas y auditar riesgos.

Definición operativa:
Seniority = (Calidad de decisiones * Velocidad de validación) / Riesgo no detectado.

Mini‑framework CAPA para no auto‑engañarte:
C Contexto: límites claros (dominio, SLA, costo, compliance).
A Alternativas: siempre 3 (actual, incremental, radical) con trade‑offs (latencia, costo, complejidad, reversibilidad, deuda).
P Pruebas: micro‑POC < 4h (dataset sintético + caso peor + fallo inyectado).
A Auditoría: checklist (funcional, rendimiento, seguridad, observabilidad, deuda explícita).

Ejemplo rápido: recálculo batch de impuestos sin degradar API P95<250ms.
Alternativa ganadora: cola + workers idempotentes tras comparar vs cron monolítico y event sourcing parcial. Se validó con dataset 1M facturas, fallo de red 2%, alarma DLQ<50.

Métricas que puedes empezar mañana:
- T1HT (ticket crudo → 3 opciones comparadas): objetivo <90 min.
- Ratio decisiones documentadas / relevantes ≥0.8.
- Lead time micro‑POC <1 día.
- % decisiones de baja reversibilidad movidas a media/alta.

Errores que veo: aceptar la primera idea “suficientemente buena”, no medir reversibilidad, enamorarse de autocompletado, no versionar prompts de diseño.

Límites: no delegues finanzas críticas, concurrencia compleja, migraciones irreversibles ni capas crypto: ahí pesa experiencia histórica.

CTA: ¿Qué métrica usas hoy para demostrar calidad de tus decisiones? Respóndela; si quieres mi hoja CAPA + tabla de reversibilidad, comenta “CAPA”.
