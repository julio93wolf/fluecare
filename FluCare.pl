:-use_module(library(pce)).
:-use_module(library(pce_util)).
:-pce_image_directory('./iconos').

% Imagenes
resource(imagen_01,image,image('influenza.jpg')).

respuesta(si).
respuesta(no).

% Reglas
pregunta('niño_menor_de_12_años',X):- respuesta(X).%N
pregunta('persona_mayor_de_12_años',X):-respuesta(X).%O
pregunta('tiene_dolor_de_cabeza',X):-respuesta(X).%P
pregunta('tiene_congestion_nasal',X):-respuesta(X).%Q
pregunta('tiene_dolor_de_garganta',X):-respuesta(X).%R
pregunta('tiene_dolor_muscular',X):-respuesta(X).%S
pregunta('tiene_dolor_articular',X):-respuesta(X).%T
pregunta('siente_debilidad_o_fatiga',X):-respuesta(X).%U
pregunta('tiene_dificultad_para_respirar_tenga_o_no_congestion_nasal',X):-respuesta(X).%V
pregunta('tiene_diarrea',X):-respuesta(X).%W
pregunta('presenta_escalofrios',X):-respuesta(X).%X
pregunta('presenta_tos_con_o_sin_flemas',X):-respuesta(X).%Nn
pregunta('presenta_irritabilidad_o_cambios_de_humor',X):-respuesta(X).%Y
pregunta('ha_presentado_convulciones',X):-respuesta(X).%Z
pregunta('tiene_fiebre_de_39_grados_o_mayor',X):-respuesta(X).%OO
pregunta('tiene_ardor_de_garganta',X):-respuesta(X).%PP
pregunta('presenta_mas_cansancio_de_lo_habitual',X):-respuesta(X).%QQ
pregunta('presenta_estornudos_recurrentes',X):-respuesta(X).%RR
pregunta('ha_estado_postrado_en_cama_de_1_a_3_semanas',X):-respuesta(X).%SS
pregunta('tiene_vomito',X):-respuesta(X).%TT
pregunta('tiene_escurrimiento_nasal',X):-respuesta(X).%UU
pregunta('tiene_fiebre_de_41_grados_o_mas',X):-respuesta(X).%WW
pregunta('tiene_ojos_llorosos',X):-respuesta(X).%XX
pregunta('presenta_salpullido',X):-respuesta(X).%YY
pregunta('tiene_falta_de_apetito',X):-respuesta(X).%ZZ
pregunta('presenta_dolor_abdominal',X):-respuesta(X).%AA
pregunta('presenta_dolor_oseo',X):-respuesta(X).%BB
pregunta('presenta_neumonia',X):-respuesta(X).%CC

% Inicio del Sistema
flucare:-
    new(Menu, dialog('Sistema Experto FluCare')),
    send_list(Menu,append,[
                   new(Txt1, text('Sistema Experto para detectar Influenza tipo B y tipo C')),
                   new(Txt2, text('Sistema Experto para la ayuda del médico en la toma de decisión para el tipo de tratamiento y cuidados del paciente.')),
                   new(Fig,figure),
                   new(Bit,bitmap(resource(imagen_01),@on))]),
    send(Txt1, font, bold),
    send(Txt1,alignment, center),
    send(Txt2, alignment, center),
    send(Bit, name, 1),
    send(Fig, display, Bit),
    send(Fig, status, 1),
    send(Fig,alignment,center),
    send(Menu, display,Fig,point(0,0)),
    send(Menu, append, new(Btn, button(paciente,and(message(@prolog, paciente))))),
    send(Menu, append, new(Btn1, button(información,and(message(@prolog, informacion)))), next_row),
    send(Btn, open),
    send(Btn1,open),
    send(Menu,open).

add_img(Ventana,Imagen) :-
new(Figura,figure),
new(Bitmap,bitmap(resource(Imagen),@on)),
send(Bitmap, name, 1),
send(Figura, display, Bitmap),
send(Figura, status, 1),
send(Ventana, display,Figura,point(0,0)).





