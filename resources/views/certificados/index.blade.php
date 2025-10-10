<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificados de Estudiantes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            <h2 class="text-center">Certificados de Estudiantes</h2>
        </div>
        <div class="card-body">
            <table id="certificadosTable" class="table table-striped mt-4">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>DNI</th>
                        <th>Nombre</th>
                        
                    </tr>
                </thead>
                <tbody>
                    @foreach ($students as $student)
                        <tr>
                            <td>{{ $student->id }}</td>
                            <td>{{ $student->dni }}</td>
                            <td>{{ $student->nombres }} {{ $student->ape_paterno }} {{ $student->ape_materno }}</td>
                            
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="text-center mt-4">
        <button class="btn btn-primary" onclick="generarCertificados()">Generar Certificados</button>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#certificadosTable').DataTable({
            pageLength: 5, // Mostrar 5 registros por página
            order: [],
            language: {
                "sEmptyTable": "No hay datos disponibles en la tabla",
                "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                "sInfoEmpty": "Mostrando 0 a 0 de 0 entradas",
                "sInfoFiltered": "(filtrado de _MAX_ entradas totales)",
                "sLengthMenu": "Mostrar _MENU_ entradas",
                "sLoadingRecords": "Cargando...",
                "sProcessing": "Procesando...",
                "sSearch": "Buscar:",
                "sZeroRecords": "No se encontraron resultados",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                }
            }
        });
    });
</script>

<script>
    async function generarCertificados() {
    Swal.fire({
        title: 'Generando Certificados...',
        html: 'Generando <b>0</b> de <b>n</b> certificados. Por favor espere...',
        icon: 'info',
        allowOutsideClick: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    try {
        const response = await fetch('{{ route("generarCertificados") }}', {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            }
        });

        const reader = response.body.getReader();
        const decoder = new TextDecoder();
        let progress = 0;
        let total = 0;

        while (true) {
            const { done, value } = await reader.read();
            if (done) break;

            const chunk = decoder.decode(value);
            const progressData = JSON.parse(chunk); // Suponiendo que el backend envía JSON con progreso
            progress = progressData.current;
            total = progressData.total;

            Swal.update({
                html: `Generando <b>${progress}</b> de <b>${total}</b> certificados. Por favor espere...`
            });
        }

        Swal.fire({
            title: '¡Éxito!',
            text: 'Se generaron todos los certificados con éxito.',
            icon: 'success'
        });
    } catch (error) {
        Swal.fire({
            title: 'Error',
            text: 'Ocurrió un problema al generar los certificados.',
            icon: 'error'
        });
    }
}

</script>
</body>
</html>
