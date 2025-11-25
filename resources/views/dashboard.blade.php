@extends('adminlte::page')

@section('title', 'Vitaldentis - Dashboard')

@section('content_header')
    <div class="d-flex justify-content-between align-items-center">
        <h1 class="text-dark font-weight-bold">Dashboard General</h1>
        <small class="text-muted">Resumen de actividad clínica</small>
    </div>
@stop

@section('content')
<div class="container-fluid pb-4">
    
    <div class="row mt-3">
        <div class="col-lg-4 col-md-6 col-12 mb-4">
            <div class="card shadow-sm border-0 h-100 kpi-card">
                <div class="card-body d-flex align-items-center justify-content-between">
                    <div>
                        <h6 class="text-muted text-uppercase font-weight-bold mb-1">Médicos</h6>
                        <h2 class="font-weight-bold mb-0 text-primary">{{ $total_medicos }}</h2>
                        <small class="text-success"><i class="fas fa-check-circle"></i> Activos</small>
                    </div>
                    <div class="icon-shape bg-light-primary text-primary rounded-circle p-3">
                        <img src="{{ asset('img/cirujano.png') }}" alt="Doctor" width="40">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4 col-md-6 col-12 mb-4">
            <div class="card shadow-sm border-0 h-100 kpi-card">
                <div class="card-body d-flex align-items-center justify-content-between">
                    <div>
                        <h6 class="text-muted text-uppercase font-weight-bold mb-1">Pacientes</h6>
                        <h2 class="font-weight-bold mb-0 text-info">{{ $total_pacientes }}</h2>
                        <small class="text-muted">Total registrados</small>
                    </div>
                    <div class="icon-shape bg-light-info text-info rounded-circle p-3">
                        <img src="{{ asset('img/paciente.png') }}" alt="Paciente" width="40">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4 col-md-6 col-12 mb-4">
            <div class="card shadow-sm border-0 h-100 kpi-card">
                <div class="card-body d-flex align-items-center justify-content-between">
                    <div>
                        <h6 class="text-muted text-uppercase font-weight-bold mb-1">Citas</h6>
                        <h2 class="font-weight-bold mb-0 text-success">{{ $total_citas }}</h2>
                        <small class="text-success"><i class="fas fa-arrow-up"></i> Histórico</small>
                    </div>
                    <div class="icon-shape bg-light-success text-success rounded-circle p-3">
                        <img src="{{ asset('img/perfil.png') }}" alt="Cita" width="40">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8 col-12 mb-4">
            <div class="card shadow border-0 h-100">
                <div class="card-header border-0 bg-white pt-4 pb-0">
                    <div class="d-flex justify-content-between">
                        <h3 class="card-title font-weight-bold text-dark">
                            <i class="fas fa-calendar-alt mr-2 text-primary"></i> Flujo de Citas (Últimos 7 días)
                        </h3>
                    </div>
                </div>
                <div class="card-body">
                    <div class="position-relative" style="height: 300px;">
                        <canvas id="sales-chart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-4 col-12 mb-4">
            <div class="card shadow border-0 h-100">
                <div class="card-header border-0 bg-white pt-4 pb-0">
                    <h3 class="card-title font-weight-bold text-dark">
                        <i class="fas fa-tooth mr-2 text-info"></i> Top Servicios
                    </h3>
                </div>
                <div class="card-body d-flex flex-column justify-content-center align-items-center">
                    <div class="position-relative w-100" style="height: 250px;">
                        <canvas id="graficoPastel"></canvas>
                    </div>
                    <div class="mt-3 text-center text-muted small">
                        Distribución de tratamientos del mes
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('css')
<style>
    /* --- Estilos Modernos Personalizados --- */
    body {
        background-color: #f4f6f9;
    }
    
    /* Tarjetas con bordes redondeados y sombras suaves */
    .card {
        border-radius: 16px !important;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    /* Efecto Hover sutil en las tarjetas KPI */
    .kpi-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.08) !important;
    }

    /* Contenedores de iconos circulares */
    .icon-shape {
        width: 64px;
        height: 64px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
    }

    /* Colores de fondo semitransparentes (Estilo Glass) */
    .bg-light-primary { background-color: rgba(0, 123, 255, 0.1); }
    .bg-light-info { background-color: rgba(23, 162, 184, 0.1); }
    .bg-light-success { background-color: rgba(40, 167, 69, 0.1); }

    /* Tipografía mejorada */
    .text-muted { color: #8898aa !important; }
    h2 { font-size: 2rem; letter-spacing: -0.5px; }
    
    /* Asegurar que el canvas sea responsive */
    canvas {
        width: 100% !important;
    }
</style>
@stop

@section('js')
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>

<script>
    $(document).ready(function() {
        
        // --- Configuración Global de Estilos Chart.js ---
        Chart.defaults.font.family = "'Segoe UI', 'Helvetica Neue', 'Arial', sans-serif";
        Chart.defaults.color = '#666';
        
        // 1. Gráfico de Barras (Citas por día)
        $.get('/api/ventas-ultimos-7-dias', function(data) {
            var ctx = document.getElementById("sales-chart").getContext("2d");
            
            // Gradiente vertical para las barras
            var gradient = ctx.createLinearGradient(0, 0, 0, 400);
            gradient.addColorStop(0, 'rgba(0, 123, 255, 0.9)');
            gradient.addColorStop(1, 'rgba(0, 123, 255, 0.3)');

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data.labels,
                    datasets: [{
                        label: 'Citas',
                        backgroundColor: gradient,
                        borderColor: '#007bff',
                        borderWidth: 1,
                        borderRadius: 5, // Barras redondeadas
                        borderSkipped: false,
                        data: data.data,
                        barThickness: 30, // Ancho fijo para elegancia
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false }, // Ocultamos la leyenda estándar
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    return context.parsed.y + ' Citas'; 
                                }
                            },
                            backgroundColor: '#fff',
                            titleColor: '#333',
                            bodyColor: '#333',
                            borderColor: '#ddd',
                            borderWidth: 1,
                            padding: 10
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Número de Citas', // Eje Y explicado
                                color: '#999',
                                font: { size: 12, weight: 'bold' }
                            },
                            grid: {
                                borderDash: [2, 4],
                                color: "#f0f0f0",
                                drawBorder: false,
                            },
                            ticks: { padding: 10 }
                        },
                        x: {
                            grid: { display: false },
                            ticks: { padding: 10 }
                        }
                    }
                }
            });
        });

        // 2. Gráfico de Dona (Top Servicios)
        $.get('/api/top-servicios', function(data) {
            var ctx = document.getElementById("graficoPastel").getContext("2d");
            new Chart(ctx, {
                type: 'doughnut', // Estilo Dona
                data: {
                    labels: data.labels,
                    datasets: [{
                        data: data.data,
                        backgroundColor: [
                            '#4e73df', '#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b', '#858796'
                        ],
                        borderWidth: 5, 
                        borderColor: '#fff', 
                        hoverOffset: 4
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    cutout: '75%', // Anillo fino
                    plugins: {
                        legend: {
                            position: 'bottom',
                            labels: {
                                usePointStyle: true,
                                padding: 20,
                                boxWidth: 8
                            }
                        }
                    }
                }
            });
        });
    });
</script>
@stop