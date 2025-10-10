@extends('adminlte::page')

@section('title', 'Historia Clínica - Registro')

@section('content_header')
    <h1>Registrar Historia Clínica</h1>
@endsection

@section('content')
<div class="card card-outline card-primary">
    <div class="card-body">
        <div class="row">
            <div class="col-md-6">
                <strong class="etiqueta">Paciente:</strong> 
                <span class="valor">{{ $paciente->nombres }} {{ $paciente->ape_paterno }} {{ $paciente->ape_materno }}</span>
            </div>
            <div class="col-md-6">
                <strong class="etiqueta">N° Historia Clínica:</strong> 
                <span class="valor">{{ $paciente->historia }}</span>
            </div>
        </div>
        <form id="formHistoriaClinica" method="POST" action="{{ route('historia_clinica_v2.store') }}">
            @csrf
            <input type="hidden" name="paciente_id" value="{{ $paciente->id }}">
            <br>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs mb-3 custom-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#tab-enfermedades" role="tab">🩺 Enfermedades</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#tab-antecedentes" role="tab">📋 Antecedentes Médicos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#tab-dentales" role="tab">🦷 Datos Dentales</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#tab-odontograma" role="tab">🦷 Odontograma</a>
                </li>
                <li class="nav-item" id="tab-tratamiento-item" style="display: block;">
                    <a class="nav-link" data-toggle="tab" href="#tab-tratamiento" role="tab">💊 Tratamiento</a>
                </li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content border p-3 rounded shadow-sm bg-white">
                <!-- Enfermedades -->
                <div class="tab-pane fade show active" id="tab-enfermedades" role="tabpanel">
                    <div class="form-group">
                        <label><strong>1. Ya sufrió o sufre de:</strong></label>
                        <div class="row">
                            @foreach($enfermedades as $enf)
                                <div class="col-md-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="enfermedades[]" value="{{ $enf->id }}" id="chk_{{ Str::slug($enf->nombre) }}"
                                            {{ in_array($enf->id, $enfermedadesPaciente) ? 'checked' : '' }}>
                                        <label class="form-check-label" for="chk_{{ Str::slug($enf->nombre) }}">{{ $enf->nombre }}</label>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        
                        <label><strong>Especificaciones:</strong></label>
                        <textarea name="obser_enfermedades" class="form-control" rows="2">{{ old('obser_enfermedades', $ultimaHistoria->obser_enfermedades ?? '') }}</textarea>
                    </div>
                </div>
                <!-- Antecedentes médicos -->
                <div class="tab-pane fade" id="tab-antecedentes" role="tabpanel">
                    <div class="form-group d-flex align-items-center">
                        <label><strong>2. ¿Está actualmente en un tratamiento médico?</strong></label>
                    </div>

                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="tratamiento_medico_select" name="tratamiento_medico_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->tratamiento_medico) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->tratamiento_medico) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="tratamiento_medico" id="tratamiento_medico_input"
                            value="{{ old('tratamiento_medico', $ultimaHistoria->tratamiento_medico ?? '') }}"
                            {{ empty($ultimaHistoria->tratamiento_medico) ? 'disabled' : '' }}>
                    </div>
                
                    <div class="form-group">
                        <label><strong>3. ¿Toma actualmente algún medicamento?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="medicamentos_actuales_select" name="medicamentos_actuales_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->medicamentos_actuales) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->medicamentos_actuales) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="medicamentos_actuales" id="medicamentos_actuales_input"
                            value="{{ old('medicamentos_actuales', $ultimaHistoria->medicamentos_actuales ?? '') }}"
                            {{ empty($ultimaHistoria->medicamentos_actuales) ? 'disabled' : '' }}>
                    </div>
                    
                    <div class="form-group">
                        <label><strong>4. ¿Tiene algún problema de cicatrización?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="problema_cicatrizacion_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->problema_cicatrizacion) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->problema_cicatrizacion) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="problema_cicatrizacion" id="problema_cicatrizacion_input"
                            value="{{ old('problema_cicatrizacion', $ultimaHistoria->problema_cicatrizacion ?? '') }}" 
                            {{ empty($ultimaHistoria->problema_cicatrizacion) ? 'disabled' : '' }}>
                    </div>

                    <div class="form-group">
                        <label><strong>5. ¿Fue sometido a transfusión de sangre?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="transfusion_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->transfusion) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->transfusion) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="transfusion" id="transfusion_input"
                            value="{{ old('transfusion', $ultimaHistoria->transfusion ?? '') }}"
                            {{ empty($ultimaHistoria->transfusion) ? 'disabled' : '' }}>
                    </div>
                    
                    <div class="form-group">
                        <label><strong>6. ¿Pasó por tratamientos de radio o quimioterapia?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="radio_quimio_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->radio_quimio) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->radio_quimio) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="radio_quimio" id="radio_quimio_input"
                            value="{{ old('radio_quimio', $ultimaHistoria->radio_quimio ?? '') }}"
                            {{ empty($ultimaHistoria->radio_quimio) ? 'disabled' : '' }}>
                    </div>
                    
                    <!-- 7. Reacción a medicamentos -->
                    <div class="form-group">
                        <label><strong>7. ¿Tuvo reacciones indeseables a algún medicamento?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="reaccion_medicamento_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->reaccion_medicamento) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->reaccion_medicamento) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="reaccion_medicamento" id="reaccion_medicamento_input"
                            value="{{ old('reaccion_medicamento', $ultimaHistoria->reaccion_medicamento ?? '') }}"
                            {{ empty($ultimaHistoria->reaccion_medicamento) ? 'disabled' : '' }}>
                    </div>

                    <!-- 8. Alergias -->
                    <div class="form-group">
                        <label><strong>8. ¿Tiene o tuvo algún tipo de alergia?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="alergia_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->alergia) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->alergia) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="alergia" id="alergia_input"
                            value="{{ old('alergia', $ultimaHistoria->alergia ?? '') }}"
                            {{ empty($ultimaHistoria->alergia) ? 'disabled' : '' }}>
                    </div>

                    <!-- 9. Problemas en articulaciones -->
                    <div class="form-group">
                        <label><strong>9. ¿Tiene o tuvo articulaciones adoloridas o hinchadas?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="problema_articulaciones_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->problema_articulaciones) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->problema_articulaciones) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="problema_articulaciones" id="problema_articulaciones_input"
                            value="{{ old('problema_articulaciones', $ultimaHistoria->problema_articulaciones ?? '') }}"
                            {{ empty($ultimaHistoria->problema_articulaciones) ? 'disabled' : '' }}>
                    </div>

                    <!-- 10. Fumador -->
                    <div class="form-group">
                        <label><strong>10. ¿Fuma? ¿Cuántos cigarros por día?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="fumador_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->fumador) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->fumador) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="fumador" id="fumador_input"
                            value="{{ old('fumador', $ultimaHistoria->fumador ?? '') }}"
                            {{ empty($ultimaHistoria->fumador) ? 'disabled' : '' }}>
                    </div>
                    
                    <!-- 11. Consumo de alcohol -->
                    <div class="form-group">
                        <label><strong>11. ¿Toma habitualmente bebidas alcohólicas?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="toma_alcohol_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->toma_alcohol) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->toma_alcohol) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="toma_alcohol" id="toma_alcohol_input"
                            value="{{ old('toma_alcohol', $ultimaHistoria->toma_alcohol ?? '') }}"
                            {{ empty($ultimaHistoria->toma_alcohol) ? 'disabled' : '' }}>
                    </div>

                    <!-- 12. Embarazo -->
                    <div class="form-group">
                        <label><strong>12. Para mujeres. ¿Está embarazada?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="embarazada_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->embarazada) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->embarazada) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="embarazada" id="embarazada_input"
                            value="{{ old('embarazada', $ultimaHistoria->embarazada ?? '') }}"
                            {{ empty($ultimaHistoria->embarazada) ? 'disabled' : '' }}>
                    </div>

                    <!-- 13. Ansiedad -->
                    <div class="form-group">
                        <label><strong>13. ¿Se considera una persona ansiosa y/o estresada?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="ansiedad_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->ansiedad) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->ansiedad) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="ansiedad" id="ansiedad_input"
                            value="{{ old('ansiedad', $ultimaHistoria->ansiedad ?? '') }}"
                            {{ empty($ultimaHistoria->ansiedad) ? 'disabled' : '' }}>
                    </div>
                    
                    <!-- 14. Problemas de sueño -->
                    <div class="form-group">
                        <label><strong>14. ¿Ha tenido o tiene problemas de sueño?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="problema_sueno_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->problema_sueno) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->problema_sueno) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="problema_sueno" id="problema_sueno_input"
                            value="{{ old('problema_sueno', $ultimaHistoria->problema_sueno ?? '') }}"
                            {{ empty($ultimaHistoria->problema_sueno) ? 'disabled' : '' }}>
                    </div>
                    <div class="form-group">
                        <label><strong>Especificaciones:</strong></label>
                        <textarea name="obser_antecedentes" class="form-control" rows="2">{{ old('obser_antecedentes', $ultimaHistoria->obser_antecedentes ?? '') }}</textarea>
                    </div>
                </div>
                <!-- Datos médicos dentales -->
                <div class="tab-pane fade" id="tab-dentales" role="tabpanel">
                    <!-- 15. Último tratamiento odontológico -->
                    <div class="form-group">
                        <label><strong>15. ¿Cuándo se hizo su último tratamiento odontológico?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="ultimo_tratamiento_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->ultimo_tratamiento) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->ultimo_tratamiento) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="ultimo_tratamiento" id="ultimo_tratamiento_input"
                            value="{{ old('ultimo_tratamiento', $ultimaHistoria->ultimo_tratamiento ?? '') }}"
                            {{ empty($ultimaHistoria->ultimo_tratamiento) ? 'disabled' : '' }}>
                    </div>            

                    <!-- 16. Miedo a tratamientos / Complicaciones anteriores -->
                    <div class="form-group">
                        <label><strong>16. ¿Tiene miedo a algún tratamiento? ¿Tuvo alguna complicación en algún tratamiento anterior?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="complicacion_tratamiento_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->complicacion_tratamiento) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->complicacion_tratamiento) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="complicacion_tratamiento" id="complicacion_tratamiento_input"
                            value="{{ old('complicacion_tratamiento', $ultimaHistoria->complicacion_tratamiento ?? '') }}"
                            {{ empty($ultimaHistoria->complicacion_tratamiento) ? 'disabled' : '' }}>
                    </div>

                    <!-- 17. Insatisfacción con la apariencia de la sonrisa -->
                    <div class="form-group">
                        <label><strong>17. ¿Está insatisfecho con la apariencia de su sonrisa?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="sonrisa_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->sonrisa) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->sonrisa) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="sonrisa" id="sonrisa_input"
                            value="{{ old('sonrisa', $ultimaHistoria->sonrisa ?? '') }}"
                            {{ empty($ultimaHistoria->sonrisa) ? 'disabled' : '' }}>
                    </div> 

                    <!-- 18. Restauraciones estéticas no agradables -->
                    <div class="form-group">
                        <label><strong>18. ¿Posee restauraciones que no le agrada su apariencia?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="restauraciones_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->restauraciones) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->restauraciones) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="restauraciones" id="restauraciones_input"
                            value="{{ old('restauraciones', $ultimaHistoria->restauraciones ?? '') }}"
                            {{ empty($ultimaHistoria->restauraciones) ? 'disabled' : '' }}>
                    </div>

                    <!-- 19. Deseo de dientes más blancos -->
                    <div class="form-group">
                        <label><strong>19. ¿Quisiera tener los dientes más blancos?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="dientes_blancos_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->dientes_blancos) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->dientes_blancos) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="dientes_blancos" id="dientes_blancos_input"
                            value="{{ old('dientes_blancos', $ultimaHistoria->dientes_blancos ?? '') }}"
                            {{ empty($ultimaHistoria->dientes_blancos) ? 'disabled' : '' }}>
                    </div>

                    <!-- 20. Dolor o ruido en la articulación al masticar -->
                    <div class="form-group">
                        <label><strong>20. ¿Su articulación le duele o siente algún ruido cuando mastica?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="dolor_masticar_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->dolor_masticar) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->dolor_masticar) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="dolor_masticar" id="dolor_masticar_input"
                            value="{{ old('dolor_masticar', $ultimaHistoria->dolor_masticar ?? '') }}"
                            {{ empty($ultimaHistoria->dolor_masticar) ? 'disabled' : '' }}>
                    </div>

                    <!-- 21. Dolor o cansancio en los músculos de la cara -->
                    <div class="form-group">
                        <label><strong>21. ¿Siente dolor o cansancio en los músculos de la cara?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="dolor_musculo_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->dolor_musculo) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->dolor_musculo) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="dolor_musculo" id="dolor_musculo_input"
                            value="{{ old('dolor_musculo', $ultimaHistoria->dolor_musculo ?? '') }}"
                            {{ empty($ultimaHistoria->dolor_musculo) ? 'disabled' : '' }}>
                    </div>

                    <!-- 22. Mordida inestable o incómoda -->
                    <div class="form-group">
                        <label><strong>22. ¿Siente su mordida inestable o incómoda?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="mordida_inestable_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->mordida_inestable) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->mordida_inestable) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="mordida_inestable" id="mordida_inestable_input"
                            value="{{ old('mordida_inestable', $ultimaHistoria->mordida_inestable ?? '') }}"
                            {{ empty($ultimaHistoria->mordida_inestable) ? 'disabled' : '' }}>
                    </div>

                    <!-- 23. Molestia al masticar alimentos consistentes -->
                    <div class="form-group">
                        <label><strong>23. ¿Siente molestia al masticar alimentos consistentes?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="molestia_masticar_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->molestia_masticar) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->molestia_masticar) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="molestia_masticar" id="molestia_masticar_input"
                            value="{{ old('molestia_masticar', $ultimaHistoria->molestia_masticar ?? '') }}"
                            {{ empty($ultimaHistoria->molestia_masticar) ? 'disabled' : '' }}>
                    </div>

                    <!-- 24. Hábito de apretar los dientes -->
                    <div class="form-group">
                        <label><strong>24. ¿Tiene el hábito de apretar los dientes?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="aprieta_dientes_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->aprieta_dientes) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->aprieta_dientes) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="aprieta_dientes" id="aprieta_dientes_input"
                            value="{{ old('aprieta_dientes', $ultimaHistoria->aprieta_dientes ?? '') }}"
                            {{ empty($ultimaHistoria->aprieta_dientes) ? 'disabled' : '' }}>
                    </div>

                    <!-- 25. Uso de placa de relajamiento -->
                    <div class="form-group">
                        <label><strong>25. ¿Ya usó alguna placa de relajamiento?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="uso_placa_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->uso_placa) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->uso_placa) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="uso_placa" id="uso_placa_input"
                            value="{{ old('uso_placa', $ultimaHistoria->uso_placa ?? '') }}"
                            {{ empty($ultimaHistoria->uso_placa) ? 'disabled' : '' }}>
                    </div>

                    <!-- 26. Dolor o sensibilidad en los dientes -->
                    <div class="form-group">
                        <label><strong>26. ¿Tiene algún diente con dolor o sensibilidad?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="diente_sensible_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->diente_sensible) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->diente_sensible) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="diente_sensible" id="diente_sensible_input"
                            value="{{ old('diente_sensible', $ultimaHistoria->diente_sensible ?? '') }}"
                            {{ empty($ultimaHistoria->diente_sensible) ? 'disabled' : '' }}>
                    </div>

                    <!-- 27. Cavidades en los dientes -->
                    <div class="form-group">
                        <label><strong>27. ¿Siente alguna cavidad en los dientes?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="diente_cavidad_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->diente_cavidad) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->diente_cavidad) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="diente_cavidad" id="diente_cavidad_input"
                            value="{{ old('diente_cavidad', $ultimaHistoria->diente_cavidad ?? '') }}"
                            {{ empty($ultimaHistoria->diente_cavidad) ? 'disabled' : '' }}>
                    </div>

                    <!-- 28. Caries en los últimos 3 años -->
                    <div class="form-group">
                        <label><strong>28. ¿Tuvo alguna caries en los últimos 3 años?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="caries_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->caries) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->caries) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="caries" id="caries_input"
                            value="{{ old('caries', $ultimaHistoria->caries ?? '') }}"
                            {{ empty($ultimaHistoria->caries) ? 'disabled' : '' }}>
                    </div>

                    <!-- 29. Desgaste dental reciente -->
                    <div class="form-group">
                        <label><strong>29. ¿Notó desgastes en los dientes recientemente?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="diente_desgaste_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->diente_desgaste) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->diente_desgaste) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="diente_desgaste" id="diente_desgaste_input"
                            value="{{ old('diente_desgaste', $ultimaHistoria->diente_desgaste ?? '') }}"
                            {{ empty($ultimaHistoria->diente_desgaste) ? 'disabled' : '' }}>
                    </div>
                    <!-- 30. Uso de hilo dental -->
                    <div class="form-group">
                        <label><strong>30. ¿Usa el hilo dental?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="usa_hilo_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->usa_hilo) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->usa_hilo) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="usa_hilo" id="usa_hilo_input"
                            value="{{ old('usa_hilo', $ultimaHistoria->usa_hilo ?? '') }}"
                            {{ empty($ultimaHistoria->usa_hilo) ? 'disabled' : '' }}>
                    </div>

                    <!-- 31. Facilidad del hilo dental en todos los dientes -->
                    <div class="form-group">
                        <label><strong>31. ¿El hilo pasa con facilidad en todos los dientes?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="hilo_facil_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->hilo_facil) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->hilo_facil) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="hilo_facil" id="hilo_facil_input"
                            value="{{ old('hilo_facil', $ultimaHistoria->hilo_facil ?? '') }}"
                            {{ empty($ultimaHistoria->hilo_facil) ? 'disabled' : '' }}>
                    </div>

                    <!-- 32. Sensación de boca seca -->
                    <div class="form-group">
                        <label><strong>32. ¿Siente normalmente la boca seca?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="boca_seca_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->boca_seca) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->boca_seca) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="boca_seca" id="boca_seca_input"
                            value="{{ old('boca_seca', $ultimaHistoria->boca_seca ?? '') }}"
                            {{ empty($ultimaHistoria->boca_seca) ? 'disabled' : '' }}>
                    </div>

                    <!-- 33. Sangrado en las encías -->
                    <div class="form-group">
                        <label><strong>33. ¿Su encía sangra con facilidad?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="sangra_encia_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->sangra_encia) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->sangra_encia) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="sangra_encia" id="sangra_encia_input"
                            value="{{ old('sangra_encia', $ultimaHistoria->sangra_encia ?? '') }}"
                            {{ empty($ultimaHistoria->sangra_encia) ? 'disabled' : '' }}>
                    </div>

                    <!-- 34. Tratamiento de encías previo -->
                    <div class="form-group">
                        <label><strong>34. ¿Ya recibió tratamiento de encías?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="trato_encias_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->trato_encias) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->trato_encias) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="trato_encias" id="trato_encias_input"
                            value="{{ old('trato_encias', $ultimaHistoria->trato_encias ?? '') }}"
                            {{ empty($ultimaHistoria->trato_encias) ? 'disabled' : '' }}>
                    </div>

                    <!-- 35. Problemas de aliento -->
                    <div class="form-group">
                        <label><strong>35. ¿Tiene algún problema en relación a su aliento?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="problema_aliento_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->problema_aliento) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->problema_aliento) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="problema_aliento" id="problema_aliento_input"
                            value="{{ old('problema_aliento', $ultimaHistoria->problema_aliento ?? '') }}"
                            {{ empty($ultimaHistoria->problema_aliento) ? 'disabled' : '' }}>
                    </div>

                    <!-- 36. Instrucciones de higienización adecuada -->
                    <div class="form-group">
                        <label><strong>36. ¿Ya recibió instrucciones de higienización adecuada?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="higiene_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->higiene) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->higiene) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="higiene" id="higiene_input"
                            value="{{ old('higiene', $ultimaHistoria->higiene ?? '') }}"
                            {{ empty($ultimaHistoria->higiene) ? 'disabled' : '' }}>
                    </div>

                    <!-- 37. Información adicional sobre estado de salud -->
                    <div class="form-group">
                        <label><strong>37. ¿Hay alguna información con respecto a su estado de salud que no ha sido considerada?</strong></label>
                    </div>
                    <div class="form-group d-flex align-items-center">
                        <select class="form-control mx-2 toggle-input" id="info_adicional_select" style="width: 100px;">
                            <option value="NO" {{ empty($ultimaHistoria->info_adicional) ? 'selected' : '' }}>NO</option>
                            <option value="SI" {{ !empty($ultimaHistoria->info_adicional) ? 'selected' : '' }}>SI</option>
                        </select>
                        <input type="text" class="form-control" name="info_adicional" id="info_adicional_input"
                            value="{{ old('info_adicional', $ultimaHistoria->info_adicional ?? '') }}"
                            {{ empty($ultimaHistoria->info_adicional) ? 'disabled' : '' }}>
                    </div>            
                </div>
                <div class="tab-pane fade" id="tab-odontograma" role="tabpanel">
                    
                    <p>
                        <strong>Versión:</strong> <span class="version_historia"></span> |
                        <strong>Fecha:</strong> <span class="fecha_historia"></span>
                    </p>

                    @include('partials.odontograma', ['hallazgos' => $hallazgos])
                    <div class="form-group">
                        <label><strong>Motivo de la consulta:</strong></label>
                        <textarea name="motivo_consulta" class="form-control" rows="2">{{ old('motivo_consulta', $ultimaHistoria->motivo_consulta ?? '') }}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Guardar Historia Clínica</button>
                </div>
                
                <div class="tab-pane fade" id="tab-tratamiento" role="tabpanel">
                    <div class="form-group">
                        <label><strong>Tratamiento:</strong></label>
                        <textarea name="motivo_consulta" class="form-control" rows="2">{{ old('motivo_consulta', $ultimaHistoria->motivo_consulta ?? '') }}</textarea>
                    </div>

                    <hr>
                    <h6>📆 Programar próxima cita de control</h6>

                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="id_medico">Médico</label>
                            <select name="id_medico" id="id_medico" class="form-control rounded-pill" required>
                                <option value="">Seleccione...</option>
                                @foreach ($medicosDatos as $medico)
                                    <option value="{{ $medico->id }}">{{ $medico->nombre_medico }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group col-md-3">
                            <label for="servicio-search">Procedimiento</label>
                            <input type="text" id="servicio-search" class="form-control rounded-pill" placeholder="Buscar procedimiento..." autocomplete="off" required>
                            <ul id="servicio-list" class="list-group position-absolute w-100" style="display: none; z-index: 1050;"></ul>
                            <input type="hidden" name="id_servicio" id="id_servicio">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-2">
                            <label for="fecha_cita">Fecha</label>
                            <input type="date" name="fecha_cita" id="fecha_cita" class="form-control rounded-pill" value="{{ date('Y-m-d') }}" required>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="hora_inicio">Hora Inicio</label>
                            <input type="time" name="hora_inicio" id="hora_inicio" class="form-control rounded-pill" required>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="hora_fin">Hora Fin</label>
                            <input type="time" name="hora_fin" id="hora_fin" class="form-control rounded-pill" required>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary mt-3">Guardar Historia Clínica</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
@section('css')
    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .etiqueta {
            color: rgb(18, 154, 245);
            font-weight: bold;
            font-size: 18px;
        }

        .valor {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        .custom-tabs .nav-link {
            border: none;
            color: #555;
            font-weight: 600;
            background-color: #f8f9fa;
            margin-right: 5px;
            border-radius: 5px 5px 0 0;
        }

        .custom-tabs .nav-link.active {
            background-color: #0d6efd;
            color: white;
        }

        .tab-content {
            background-color: #ffffff;
            border-radius: 0 5px 5px 5px;
            border: 1px solid #dee2e6;
        }

        /* Aumentar altura y centrar verticalmente el texto del select2 */
        .select2-container--default .select2-selection--single {
            height: 45px !important;
            display: flex;
            align-items: center;
            padding: 0 12px;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }

        /* Alinear el texto verticalmente */
        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: normal !important;
            padding-left: 0;
            margin-top: 0 !important;
        }

        /* Alinear la flecha del dropdown */
        .select2-container--default .select2-selection--single .select2-selection__arrow {
            height: 45px !important;
            top: 0 !important;
            right: 10px;
        }
        #estadoSelect {
            margin-right: 10px;
        }
        /* Estilo base del UL */
        #servicio-list {
            position: absolute; /* Posición relativa al contenedor padre */
            z-index: 1050; /* Asegura que esté sobre los demás elementos */
            width: 100%; /* Ajusta el ancho al contenedor padre */
            background-color: #fff; /* Fondo blanco */
            border: 1px solid #ddd; /* Bordes */
            border-radius: 4px; /* Bordes redondeados */
            max-height: 150px; /* Alto máximo */
            overflow-y: auto; /* Habilita scroll si excede el alto */
            list-style: none; /* Elimina los puntos de lista */
            margin: 0; /* Sin margen */
            padding: 0; /* Sin padding */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Sombra para resaltarlo */
        }
    /* Estilo de cada elemento de la lista */
        #servicio-list li {
            padding: 10px; /* Espaciado interno */
            border-bottom: 1px solid #ddd; /* Separador entre elementos */
            cursor: pointer; /* Cambia el cursor al estilo mano */
            transition: background-color 0.2s ease-in-out; /* Efecto de cambio suave */
        }

        /* El último elemento no tiene borde inferior */
        #servicio-list li:last-child {
            border-bottom: none;
        }

        /* Efecto hover */
        #servicio-list li:hover {
            background-color: #b1fdb7; /* Cambia el fondo al pasar el mouse */
        }
    </style>
@endsection
@section('js')
    <!-- jQuery (necesario para Select2) -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Select2 JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    <!-- SweetAlert2 -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        $(document).ready(function () {
            if ($.fn.select2) {
                console.log('✅ Select2 cargado correctamente');
                
                $('#tratamientoSelect').select2({
                    placeholder: '-- Seleccione una opción --',
                    allowClear: true,
                    width: '100%'
                });

                $('#estadoSelect').select2({
                    minimumResultsForSearch: Infinity,
                    width: 'auto'
                });
            } else {
                console.error('❌ Error: Select2 no está disponible.');
            }
        });
    </script>

    @if (session('success'))
    <script>
        Swal.fire('Éxito', '{{ session('success') }}', 'success');
    </script>
    @endif

    @if ($errors->any())
    <script>
        Swal.fire('Error', 'Hay campos con errores. Revise el formulario.', 'error');
    </script>
    @endif
    <script>
    document.querySelectorAll(".toggle-input").forEach(select => {
        select.addEventListener("change", function () {
            let inputId = this.id.replace("_select", "_input");
            let input = document.getElementById(inputId);

            if (input) {
                input.disabled = (this.value !== "SI"); // 🔹 Activa solo si se selecciona "SI"
                
                if (this.value === "SI") {
                    input.removeAttribute("disabled"); // 🔹 Elimina la propiedad "disabled"
                    input.focus(); // 🔹 Enfoca el campo automáticamente al activarlo
                } else {
                    input.value = ""; // 🔹 Limpia el campo si se selecciona "NO"
                    input.setAttribute("disabled", "true"); // 🔹 Desactiva el campo
                }
            }
        });
    });
    document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('formHistoriaClinica');
    const input = document.getElementById('hallazgos_json');

    form.addEventListener('submit', function (e) {
        try {
            const data = JSON.stringify(hallazgosRegistrados);
            JSON.parse(data); // validar que es válido
            input.value = data;
        } catch (err) {
            e.preventDefault();
            console.error('❌ Error al convertir hallazgos a JSON', hallazgosRegistrados, err);
            Swal.fire('Error', 'Los hallazgos no están correctamente definidos.', 'error');
            return;
        }

        if (!input.value || input.value === "[]") {
            console.warn('⚠️ hallazgos_json está vacío justo antes del submit:', input.value);
        } else {
            console.log('✅ hallazgos_json enviado:', input.value);
        }
    });
});

</script>
<script>
    let servicios = [];

    // Cargar servicios desde el backend
    function cargarServicios(callback) {
        $.ajax({
            url: '{{ route("servicios.listado") }}',
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                servicios = data;
                if (typeof callback === 'function') callback(data);
            },
            error: function(xhr, status, error) {
                console.error('Error al cargar servicios:', error, xhr.responseText);
            }
        });
    }

    // Filtrar servicios según texto ingresado
    function filtrarServicios($input, $lista) {
        const valor = $input.val().toLowerCase();
        $lista.empty();

        const resultados = servicios.filter(s =>
            s.nombre.toLowerCase().includes(valor)
        );

        resultados.forEach(servicio => {
            const li = $('<li></li>')
                .addClass('list-group-item list-group-item-action')
                .text(servicio.nombre)
                .data('id', servicio.id)
                .data('tiempo', servicio.tiempominutos || 30);
            $lista.append(li);
        });

        $lista.toggle(resultados.length > 0);
    }

    // Calcular la hora fin en base al tiempo
    function calcularHoraFin(horaInicio, minutos) {
        const [h, m] = horaInicio.split(':').map(Number);
        const totalMin = h * 60 + m + minutos;

        const hFin = Math.floor(totalMin / 60) % 24;
        const mFin = totalMin % 60;

        return `${String(hFin).padStart(2, '0')}:${String(mFin).padStart(2, '0')}`;
    }

    // Seleccionar un servicio desde la lista
    function seleccionarServicio($item) {
        const nombre = $item.text();
        const id = $item.data('id');
        const tiempo = parseInt($item.data('tiempo') || 30);

        $('#servicio-search').val(nombre);
        $('#id_servicio').val(id);
        $('#servicio-list').hide();

        const horaInicio = $('#hora_inicio').val();
        if (horaInicio && /^\d{2}:\d{2}$/.test(horaInicio)) {
            const horaFin = calcularHoraFin(horaInicio, tiempo);
            $('#hora_fin').val(horaFin);
        }
    }

    $(document).ready(function () {
        const $inputServicio = $('#servicio-search');
        const $listaServicios = $('#servicio-list');

        cargarServicios(function () {
            $inputServicio.on('input', function () {
                filtrarServicios($inputServicio, $listaServicios);
            });

            $listaServicios.on('click', 'li', function () {
                seleccionarServicio($(this));
            });
        });

        // Ocultar lista si se hace clic fuera
        $(document).click(function (e) {
            if (!$(e.target).closest('#servicio-search, #servicio-list').length) {
                $listaServicios.hide();
            }
        });
    });
</script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('formHistoriaClinica');

    form.addEventListener('submit', function (e) {
        const idMedico = document.getElementById('id_medico').value;
        const idServicio = document.getElementById('id_servicio').value;
        const fecha = document.getElementById('fecha_cita').value;
        const horaInicio = document.getElementById('hora_inicio').value;
        const horaFin = document.getElementById('hora_fin').value;

        // Validaciones básicas
        if (!idMedico || !idServicio || !fecha || !horaInicio || !horaFin) {
            e.preventDefault();
            Swal.fire('Faltan datos', 'Completa todos los campos de la cita.', 'warning');
            return;
        }

        // Validar que hora fin sea posterior a hora inicio
        if (horaInicio >= horaFin) {
            e.preventDefault();
            Swal.fire('Horario inválido', 'La hora de fin debe ser posterior a la hora de inicio.', 'error');
            return;
        }

        // Validar que el servicio se haya seleccionado de la lista
        if (!idServicio || isNaN(parseInt(idServicio))) {
            e.preventDefault();
            Swal.fire('Error', 'Debes seleccionar un procedimiento válido.', 'error');
        }
    });
});
</script>

@endsection
