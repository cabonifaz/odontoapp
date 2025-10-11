@extends('adminlte::page')

@section('title', 'Vitaldentis')


@section('content')
    <!-- Content Wrapper. Contains page content -->
    
      <!-- Main content -->
      <br>
        <!-- Full-width container -->
        <div class="container-fluid" style="margin-left: 0; padding-left: 0;">
          
          <!-- Primera fila: Médicos, Pacientes y Citas -->
          <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12"> <!-- Columnas flexibles que ocupan todo el espacio -->
              <div class="info-box mb-3">
                <span class="info-box-icon bg-success elevation-1">
                  <img src="{{ asset('img/cirujano.png') }}" alt="Doctor" style="width: 100%; height: 50px;">
                </span>
                <div class="info-box-content">
                  <span class="info-box-text">Médicos Registrados</span>
                  <span class="info-box-number">{{ $total_medicos }}</span>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 col-sm-12">
              <div class="info-box mb-3">
                <span class="info-box-icon bg-success elevation-1">
                  <img src="{{ asset('img/paciente.png') }}" alt="Paciente" style="width: 100%; height: 50px;">
                </span>
                <div class="info-box-content">
                  <span class="info-box-text">Pacientes Registrados</span>
                  <span class="info-box-number">{{ $total_pacientes }}</span>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 col-sm-12">
              <div class="info-box mb-3">
                <span class="info-box-icon bg-success elevation-1">
                  <img src="{{ asset('img/perfil.png') }}" alt="Cita" style="width: 100%; height: 50px;">
                </span>
                <div class="info-box-content">
                  <span class="info-box-text">Citas Registradas</span>
                  <span class="info-box-number">{{ $total_citas }}</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Segunda fila: Gráfico de citas y servicios -->
          <div class="row">
            <div class="col-lg-6 col-sm-12">
              <div class="card card-fixed-height">
                <div class="card-header border-0">
                  <h3 class="card-title">Citas de los Últimos 7 días</h3>
                </div>
                <div class="card-body">
                  <p class="d-flex flex-column">
                    <span id="total-ventas" class="text-bold text-lg">-</span>
                  </p>
                  <div class="position-relative mb-4">
                    <canvas id="sales-chart" height="200"></canvas>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-lg-6 col-sm-12">
              <div class="card card-fixed-height">
                <div class="card-header border-0">
                  <h3 class="card-title">Servicios más atendidos del mes</h3>
                </div>
                <div class="card-body">
                  <p class="d-flex flex-column">
                    <span id="total-ventas_prod" class="text-bold text-lg">-</span>
                  </p>
                  <div class="position-relative mb-4">
                    <canvas id="graficoPastel" height="200"></canvas>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      
    

<!-- Scripts -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function() {
        // Obtener datos de ventas de los últimos 7 días
        $.get('/api/ventas-ultimos-7-dias', function(data) {
            var ventasUltimosDias = {
                labels: data.labels,
                data: data.data
            };
            //console.log("ventasUltimosDias",ventasUltimosDias);
            var salesChartCtx = document.getElementById("sales-chart").getContext("2d");
            new Chart(salesChartCtx, {
                type: 'bar',
                data: {
                    labels: ventasUltimosDias.labels,
                    datasets: [{
                        label: 'Total de Citas',
                        backgroundColor: '#007bff',
                        data: ventasUltimosDias.data,
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false // Permite que el gráfico use todo el espacio de la tarjeta
                }
            });
        });

        // Obtener datos de top servicios
        $.get('/api/top-servicios', function(data) {
            var productosMasVendidos = {
                labels: data.labels,
                data: data.data
            };

            var graficoPastelCtx = document.getElementById("graficoPastel").getContext("2d");
            new Chart(graficoPastelCtx, {
                type: 'pie',
                data: {
                    labels: productosMasVendidos.labels,
                    datasets: [{
                        data: productosMasVendidos.data,
                        backgroundColor: ['green', 'blue', 'yellow', 'orange', 'red', 'gray']
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false // Permite que el gráfico use todo el espacio de la tarjeta
                }
            });
        });
    });
</script>

<style>
    .card-fixed-height {
        height: 380px; /* Ajusta la altura según tus necesidades */
        
    }

    canvas {
        width: 100% !important; /* Esto asegura que el canvas use el 100% de ancho */
        height: auto !important; /* Esto asegura que el canvas mantenga proporción */
        max-height: 380px; /* Ajusta según la altura de tu tarjeta */
    }


</style>

@endsection
