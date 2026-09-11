# Sistema de Gestión de Historia Clínica Electrónica

Base de Datos - Unidad 2 - Ejercicio 3

## Consigna
Diseñar el esquema conceptual de base de datos para una clínica privada que centralice la información médica de sus pacientes mediante una historia clínica electrónica unificada, optimizando la asignación de turnos y evitando la pérdida de diagnósticos.

## Lógica

### Entidades Principales:
- **PACIENTES**: Identificados por número de historia clínica, almacenan DNI, nombre, apellido, fecha de nacimiento, domicilio y obra social.
- **MEDICOS**: Identificados por matrícula profesional, registran nombre, teléfono y especialidad principal.
- **ESPECIALIDADES**: Catálogo de especialidades médicas (Cardiología, Pediatría, etc.) identificadas por código.
- **TURNOS**: Registran cada consulta médica con fecha, hora, estado (Programado, Atendido, Cancelado) y diagnóstico/observación.
- **MEDICAMENTOS**: Catálogo de medicamentos identificados por código alfanumérico, con nombre comercial, monodroga y laboratorio.
- **PRESCRIPCIONES**: Entidad intermedia M:N que registra la receta de medicamentos en cada turno, incluyendo dosis, frecuencia y duración del tratamiento.

### Relaciones:
- **SOLICITA (1:N)**: Un paciente solicita múltiples turnos; cada turno pertenece a un único paciente.
- **ATIENDE (1:N)**: Un médico atiende múltiples turnos; cada turno es atendido por un único médico.
- **POSEE (M:N)**: Un médico posee múltiples especialidades (principal y secundarias); una especialidad puede pertenecer a varios médicos.
- **REGISTRA_EN (1:N)**: Un turno genera múltiples prescripciones; cada prescripción pertenece a un único turno.
- **RECEPTA (M:N)**: Un medicamento puede ser recetado en múltiples prescripciones; una prescripción puede incluir múltiples medicamentos.

### Decisiones de Diseño:
- Se creó la entidad **PRESCRIPCIONES** como tabla intermedia M:N para registrar los atributos específicos de cada medicamento recetado (dosis, frecuencia, duración), permitiendo que un mismo medicamento se prescriba en diferentes consultas.
- La relación **POSEE** entre Médicos y Especialidades es M:N para permitir que un médico tenga especialidades secundarias además de la principal.
- **TURNOS** almacena diagnóstico/observación porque cada turno genera un único registro de atención, evitando duplicación de datos.
- Se utilizó **número_historia_clinica** como identificador de pacientes en lugar de DNI para mantener compatibilidad con sistemas clínicos estándar.

## Resultado
<img width="832" height="1123" alt="BaseDeDatos-U1-Ej03-SistemaClinica" src="https://github.com/user-attachments/assets/830609b2-64c4-4e04-8638-025f4bc022f3" />
