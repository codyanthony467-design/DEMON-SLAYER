extends Node2D

# Juego de lucha 1 contra 1 estilo arcade, con los sprites pixel-art del archivo del usuario.
const W := 1280.0
const H := 720.0
const FLOOR_Y := 570.0
const WALK_SPEED := 310.0
const JUMP_SPEED := -650.0
const GRAVITY := 1550.0
const MAX_HP := 100

# Explicit resource manifests are required for exported PCK builds; runtime DirAccess scans may not enumerate packaged folders.
const CHARACTER_FOLDERS: Array[String] = [
	"Demonio_Arana_Hija_12_Sprites_Separados",
	"Genya_Sprites_12_sprites_separados",
	"Giyu_Tomioka_12_sprites_separados",
	"Gyomei_Himejima_12_sprites_separados",
	"Hand_Demon_12_sprites_separados",
	"Headless Demon_12_sprites_separados",
	"Horned_Demon_12_sprites_separados",
	"Inosuke_12_sprites_separados",
	"Kanae_Kocho_12_sprites_separados",
	"Kanao_Tsuyuri_12_sprites_separados_",
	"Kyojuro_Rengoku_12_sprites_separados",
	"Mitsuri_12_sprites_separados",
	"Muichiro_Tokito_12_sprites_separados",
	"Muzan Kibutsuji_12_sprites_separados",
	"Obanai_12_sprites_separados",
	"Sanemi_12_sprites_separados",
	"Shinobu_Kocho_12_sprites_separados",
	"Spider_Demon_12_sprites_separados",
	"Spider_Demon_Mother_12_sprites_separados",
	"Spider_Demon_Son_12_Sprites_separados",
	"Susamaru_12_sprites_separados",
	"Swamp_Demon_12_sprites_separadas",
	"Tanjiro_12_sprites_separados",
	"Temple_Demon_12_sprites_separados",
	"Tongue_Demon_12_Sprites_Separados",
	"Tongue_Demon_12_sprites_Separados",
	"Yahaba_12_sprites_separados",
	"Zenitsu_12_sprites_separados",
	"nezuko_demon_12_sprites_separados"
]
const CHARACTER_FRAME_FILES := {
	"Demonio_Arana_Hija_12_Sprites_Separados": [
		"Demonio_Arana_Hija_01.png",
		"Demonio_Arana_Hija_02.png",
		"Demonio_Arana_Hija_03.png",
		"Demonio_Arana_Hija_04.png",
		"Demonio_Arana_Hija_05.png",
		"Demonio_Arana_Hija_06.png",
		"Demonio_Arana_Hija_07.png",
		"Demonio_Arana_Hija_08.png",
		"Demonio_Arana_Hija_09.png",
		"Demonio_Arana_Hija_10.png",
		"Demonio_Arana_Hija_11.png",
		"Demonio_Arana_Hija_12.png"
],
	"Genya_Sprites_12_sprites_separados": [
		"Genya_01.png",
		"Genya_02.png",
		"Genya_03.png",
		"Genya_04.png",
		"Genya_05.png",
		"Genya_06.png",
		"Genya_07.png",
		"Genya_08.png",
		"Genya_09.png",
		"Genya_10.png",
		"Genya_11.png",
		"Genya_12.png"
],
	"Giyu_Tomioka_12_sprites_separados": [
		"giyu_01_idle.png",
		"giyu_02_caminar.png",
		"giyu_03_correr.png",
		"giyu_04_salto.png",
		"giyu_05_postura_espada.png",
		"giyu_06_corte_agua.png",
		"giyu_07_guardia.png",
		"giyu_08_reaccion.png",
		"giyu_09_agachado.png",
		"giyu_10_embestida.png",
		"giyu_11_ataque_dragon_agua.png",
		"giyu_12_aterrizaje.png"
],
	"Gyomei_Himejima_12_sprites_separados": [
		"gyomei_01_oracion.png",
		"gyomei_02_guardia.png",
		"gyomei_03_carrera.png",
		"gyomei_04_salto_maza.png",
		"gyomei_05_cadena.png",
		"gyomei_06_barrido.png",
		"gyomei_07_golpe_suelo.png",
		"gyomei_08_giro.png",
		"gyomei_09_oracion_agachado.png",
		"gyomei_10_embestida.png",
		"gyomei_11_ataque_pesado.png",
		"gyomei_12_aterrizaje_rocas.png"
],
	"Hand_Demon_12_sprites_separados": [
		"01_idle.png",
		"02_heavy_step.png",
		"03_lunge.png",
		"04_claw_sweep.png",
		"05_roar.png",
		"06_ground_slam.png",
		"07_guard.png",
		"08_multi_hand_strike.png",
		"09_spinning_attack.png",
		"10_curl_attack.png",
		"11_crouch_slam.png",
		"12_final_multi_hand.png"
],
	"Headless Demon_12_sprites_separados": [
		"demonio_pose_01.png",
		"demonio_pose_02.png",
		"demonio_pose_03.png",
		"demonio_pose_04.png",
		"demonio_pose_05.png",
		"demonio_pose_06.png",
		"demonio_pose_07.png",
		"demonio_pose_08.png",
		"demonio_pose_09.png",
		"demonio_pose_10.png",
		"demonio_pose_11.png",
		"demonio_pose_12.png"
],
	"Horned_Demon_12_sprites_separados": [
		"Horned_Demon_01.png",
		"Horned_Demon_02.png",
		"Horned_Demon_03.png",
		"Horned_Demon_04.png",
		"Horned_Demon_05.png",
		"Horned_Demon_06.png",
		"Horned_Demon_07.png",
		"Horned_Demon_08.png",
		"Horned_Demon_09.png",
		"Horned_Demon_10.png",
		"Horned_Demon_11.png",
		"Horned_Demon_12.png"
],
	"Inosuke_12_sprites_separados": [
		"Inosuke_01_idle.png",
		"Inosuke_02_caminando.png",
		"Inosuke_03_corriendo.png",
		"Inosuke_04_salto_doble_espada.png",
		"Inosuke_05_guardia.png",
		"Inosuke_06_corte_azul.png",
		"Inosuke_07_giro_ataque.png",
		"Inosuke_08_doble_espada_arriba.png",
		"Inosuke_09_agachado.png",
		"Inosuke_10_dash.png",
		"Inosuke_11_embestida.png",
		"Inosuke_12_aterrizaje.png"
],
	"Kanae_Kocho_12_sprites_separados": [
		"kanae_01_idle.png",
		"kanae_02_caminar.png",
		"kanae_03_correr.png",
		"kanae_04_salto.png",
		"kanae_05_corte_horizontal.png",
		"kanae_06_corte_mariposa.png",
		"kanae_07_giro_mariposa.png",
		"kanae_08_guardia.png",
		"kanae_09_pose_serena.png",
		"kanae_10_embestida.png",
		"kanae_11_estocada.png",
		"kanae_12_pose_final.png"
],
	"Kanao_Tsuyuri_12_sprites_separados_": [
		"kanao_01_idle.png",
		"kanao_02_caminar.png",
		"kanao_03_correr.png",
		"kanao_04_salto.png",
		"kanao_05_corte_horizontal.png",
		"kanao_06_corte_mariposa.png",
		"kanao_07_giro_mariposa.png",
		"kanao_08_guardia.png",
		"kanao_09_pose_serena.png",
		"kanao_10_embestida.png",
		"kanao_11_estocada.png",
		"kanao_12_pose_final.png"
],
	"Kyojuro_Rengoku_12_sprites_separados": [
		"rengoku_01_idle.png",
		"rengoku_02_caminar.png",
		"rengoku_03_correr.png",
		"rengoku_04_salto.png",
		"rengoku_05_corte_horizontal.png",
		"rengoku_06_corte_llameante.png",
		"rengoku_07_giro_llamas.png",
		"rengoku_08_ataque_vertical.png",
		"rengoku_09_guardia.png",
		"rengoku_10_embestida.png",
		"rengoku_11_estocada_final.png",
		"rengoku_12_remate.png"
],
	"Mitsuri_12_sprites_separados": [
		"mitsuri_01_idle.png",
		"mitsuri_02_correr.png",
		"mitsuri_03_embestida.png",
		"mitsuri_04_salto.png",
		"mitsuri_05_corte_horizontal.png",
		"mitsuri_06_corte_rosa.png",
		"mitsuri_07_giro_rosa.png",
		"mitsuri_08_guardia.png",
		"mitsuri_09_impacto.png",
		"mitsuri_10_agachada.png",
		"mitsuri_11_embestida_con_katana.png",
		"mitsuri_12_pose_final.png"
],
	"Muichiro_Tokito_12_sprites_separados": [
		"muichiro_01_idle.png",
		"muichiro_02_caminar.png",
		"muichiro_03_correr.png",
		"muichiro_04_dash_aereo.png",
		"muichiro_05_postura_espada.png",
		"muichiro_06_corte_niebla.png",
		"muichiro_07_giro_niebla.png",
		"muichiro_08_guardia.png",
		"muichiro_09_postura_niebla.png",
		"muichiro_10_deslizamiento.png",
		"muichiro_11_corte_avanzado.png",
		"muichiro_12_aterrizaje.png"
],
	"Muzan Kibutsuji_12_sprites_separados": [
		"Muzan_01.png",
		"Muzan_02.png",
		"Muzan_03.png",
		"Muzan_04.png",
		"Muzan_05.png",
		"Muzan_06.png",
		"Muzan_07.png",
		"Muzan_08.png",
		"Muzan_09.png",
		"Muzan_10.png",
		"Muzan_11.png",
		"Muzan_12.png"
],
	"Obanai_12_sprites_separados": [
		"obanai_01_idle.png",
		"obanai_02_caminar.png",
		"obanai_03_correr.png",
		"obanai_04_salto.png",
		"obanai_05_guardia.png",
		"obanai_06_corte_serpiente.png",
		"obanai_07_combo.png",
		"obanai_08_ataque_circular.png",
		"obanai_09_postura.png",
		"obanai_10_embestida.png",
		"obanai_11_corte_veloz.png",
		"obanai_12_aterrizaje.png"
],
	"Sanemi_12_sprites_separados": [
		"sanemi_01_idle.png",
		"sanemi_02_caminar.png",
		"sanemi_03_correr.png",
		"sanemi_04_salto.png",
		"sanemi_05_guardia.png",
		"sanemi_06_corte_viento.png",
		"sanemi_07_combo.png",
		"sanemi_08_ataque_arriba.png",
		"sanemi_09_postura.png",
		"sanemi_10_embestida.png",
		"sanemi_11_corte_bajo.png",
		"sanemi_12_aterrizaje.png"
],
	"Shinobu_Kocho_12_sprites_separados": [
		"shinobu_01_idle.png",
		"shinobu_02_caminar.png",
		"shinobu_03_correr.png",
		"shinobu_04_dash_aereo.png",
		"shinobu_05_postura_espada.png",
		"shinobu_06_corte_mariposa.png",
		"shinobu_07_giro_mariposa.png",
		"shinobu_08_guardia.png",
		"shinobu_09_pose_mariposas.png",
		"shinobu_10_embestida.png",
		"shinobu_11_estocada.png",
		"shinobu_12_aterrizaje.png"
],
	"Spider_Demon_12_sprites_separados": [
		"Spider_Demon_Father_01.png",
		"Spider_Demon_Father_02.png",
		"Spider_Demon_Father_03.png",
		"Spider_Demon_Father_04.png",
		"Spider_Demon_Father_05.png",
		"Spider_Demon_Father_06.png",
		"Spider_Demon_Father_07.png",
		"Spider_Demon_Father_08.png",
		"Spider_Demon_Father_09.png",
		"Spider_Demon_Father_10.png",
		"Spider_Demon_Father_11.png",
		"Spider_Demon_Father_12.png"
],
	"Spider_Demon_Mother_12_sprites_separados": [
		"Spider_Demon_Mother_01.png",
		"Spider_Demon_Mother_02.png",
		"Spider_Demon_Mother_03.png",
		"Spider_Demon_Mother_04.png",
		"Spider_Demon_Mother_05.png",
		"Spider_Demon_Mother_06.png",
		"Spider_Demon_Mother_07.png",
		"Spider_Demon_Mother_08.png",
		"Spider_Demon_Mother_09.png",
		"Spider_Demon_Mother_10.png",
		"Spider_Demon_Mother_11.png",
		"Spider_Demon_Mother_12.png"
],
	"Spider_Demon_Son_12_Sprites_separados": [
		"Spider_Demon_Son_01.png",
		"Spider_Demon_Son_02.png",
		"Spider_Demon_Son_03.png",
		"Spider_Demon_Son_04.png",
		"Spider_Demon_Son_05.png",
		"Spider_Demon_Son_06.png",
		"Spider_Demon_Son_07.png",
		"Spider_Demon_Son_08.png",
		"Spider_Demon_Son_09.png",
		"Spider_Demon_Son_10.png",
		"Spider_Demon_Son_11.png",
		"Spider_Demon_Son_12.png"
],
	"Susamaru_12_sprites_separados": [
		"01_idle.png",
		"02_run.png",
		"03_ball_strike.png",
		"04_throw.png",
		"05_dual_balls.png",
		"06_jump_kick.png",
		"07_spin_attack.png",
		"08_multi_ball.png",
		"09_happy.png",
		"10_turn.png",
		"11_guard.png",
		"12_final_attack.png"
],
	"Swamp_Demon_12_sprites_separadas": [
		"01_swamp_demon.png",
		"02_swamp_demon.png",
		"03_swamp_demon.png",
		"04_swamp_demon.png",
		"05_swamp_demon.png",
		"06_swamp_demon.png",
		"07_swamp_demon.png",
		"08_swamp_demon.png",
		"09_swamp_demon.png",
		"10_swamp_demon.png",
		"11_swamp_demon.png",
		"12_swamp_demon.png"
],
	"Tanjiro_12_sprites_separados": [
		"tanjiro_01_idle.png",
		"tanjiro_02_caminar.png",
		"tanjiro_03_correr.png",
		"tanjiro_04_salto_agua.png",
		"tanjiro_05_corte_horizontal.png",
		"tanjiro_06_ola_de_agua.png",
		"tanjiro_07_giro_agua.png",
		"tanjiro_08_guardia.png",
		"tanjiro_09_pose_serena.png",
		"tanjiro_10_embestida.png",
		"tanjiro_11_dragon_de_agua.png",
		"tanjiro_12_pose_final.png"
],
	"Temple_Demon_12_sprites_separados": [
		"temple_demon_01.png",
		"temple_demon_02.png",
		"temple_demon_03.png",
		"temple_demon_04.png",
		"temple_demon_05.png",
		"temple_demon_06.png",
		"temple_demon_07.png",
		"temple_demon_08.png",
		"temple_demon_09.png",
		"temple_demon_10.png",
		"temple_demon_11.png",
		"temple_demon_12.png"
],
	"Tongue_Demon_12_Sprites_Separados": [
		"Tongue_Demon_01.png",
		"Tongue_Demon_02.png",
		"Tongue_Demon_03.png",
		"Tongue_Demon_04.png",
		"Tongue_Demon_05.png",
		"Tongue_Demon_06.png",
		"Tongue_Demon_07.png",
		"Tongue_Demon_08.png",
		"Tongue_Demon_09.png",
		"Tongue_Demon_10.png",
		"Tongue_Demon_11.png",
		"Tongue_Demon_12.png"
],
	"Tongue_Demon_12_sprites_Separados": [
		"Tongue_Demon_01.png",
		"Tongue_Demon_02.png",
		"Tongue_Demon_03.png",
		"Tongue_Demon_04.png",
		"Tongue_Demon_05.png",
		"Tongue_Demon_06.png",
		"Tongue_Demon_07.png",
		"Tongue_Demon_08.png",
		"Tongue_Demon_09.png",
		"Tongue_Demon_10.png",
		"Tongue_Demon_11.png",
		"Tongue_Demon_12.png"
],
	"Yahaba_12_sprites_separados": [
		"yahaba_01.png",
		"yahaba_02.png",
		"yahaba_03.png",
		"yahaba_04.png",
		"yahaba_05.png",
		"yahaba_06.png",
		"yahaba_07.png",
		"yahaba_08.png",
		"yahaba_09.png",
		"yahaba_10.png",
		"yahaba_11.png",
		"yahaba_12.png"
],
	"Zenitsu_12_sprites_separados": [
		"Zenitsu_01_idle.png",
		"Zenitsu_02_caminando.png",
		"Zenitsu_03_corriendo.png",
		"Zenitsu_04_salto_rayo.png",
		"Zenitsu_05_ataque_bajo.png",
		"Zenitsu_06_corte_rayo.png",
		"Zenitsu_07_giro_rayo.png",
		"Zenitsu_08_ataque_arriba.png",
		"Zenitsu_09_descanso.png",
		"Zenitsu_10_dash.png",
		"Zenitsu_11_estocada_rayo.png",
		"Zenitsu_12_aterrizaje.png"
],
	"nezuko_demon_12_sprites_separados": [
		"nezuko_demon_pose_01.png",
		"nezuko_demon_pose_02.png",
		"nezuko_demon_pose_03.png",
		"nezuko_demon_pose_04.png",
		"nezuko_demon_pose_05.png",
		"nezuko_demon_pose_06.png",
		"nezuko_demon_pose_07.png",
		"nezuko_demon_pose_08.png",
		"nezuko_demon_pose_09.png",
		"nezuko_demon_pose_10.png",
		"nezuko_demon_pose_11.png",
		"nezuko_demon_pose_12.png"
],
}
const STAGE_FILES: Array[String] = [
	"01_Aldea_al_atardecer.png",
	"02_Entrenamiento_de_Tanjiro.png",
	"03_Mansion_Ubuyashiki.png",
	"04_Seleccion_Final.png",
	"05_Monte_Sagiri.png",
	"06_Tren_Infinito_Exterior.png",
	"07_Tren_Infinito_Interior.png",
	"08_Distrito_Rojo_Entrada.png",
	"09_Distrito_Rojo_Calles.png",
	"10_Distrito_Rojo_Interior.png",
	"11_Montana_Natagumo.png",
	"12_Interior_Casa_de_Arana.png",
	"13_Aldea_de_Herreros.png",
	"14_Cueva_de_Herreros.png",
	"15_Bosque_de_los_Pilares.png",
	"16_Sede_de_los_Pilares.png",
	"17_Campo_de_Wisteria.png",
	"18_Castillo_Infinito_Exterior.png",
	"19_Castillo_Infinito_Interior_1.png",
	"20_Castillo_Infinito_Interior_2.png",
	"21_Castillo_Infinito_Interior_3.png",
	"22_Castillo_Infinito_Puentes.png",
	"23_Castillo_Infinito_Habitacion.png",
	"24_Campo_de_Batalla_Final.png",
	"25_Amanecer_Final.png",
	"26_Bosque_Nevado.png",
	"27_Pueblo_en_Llamas.png",
	"28_Noche_de_Luna_Llena.png",
	"29_Acantilados.png"
]

var font: Font
var menu_background: Texture2D
var hunters: Array[String] = []
var demons: Array[String] = []
var hunter_thumbs: Array[Texture2D] = []
var demon_thumbs: Array[Texture2D] = []
var hunter_frames: Array[Texture2D] = []
var demon_frames: Array[Texture2D] = []
var hunter_idx := 0
var demon_idx := 0
var state := "menu" # menu, select, fight, result
var multiplayer_local := false
var sound_player: AudioStreamPlayer
var menu_music_player: AudioStreamPlayer
var sound_enabled := true
var menu_idx := 0
var p2_select_left_was_down := false
var p2_select_right_was_down := false
var p2_attack_was_down := false
var p2_special_was_down := false
var p_pos := Vector2(360, FLOOR_Y)
var e_pos := Vector2(920, FLOOR_Y)
var p_vel_y := 0.0
var e_vel_y := 0.0
var p_hp := MAX_HP
var e_hp := MAX_HP
var timer := 60.0
var p_anim := 0.0
var e_anim := 0.0
var p_frame := 0
var e_frame := 0
var p_attack_cd := 0.0
var e_attack_cd := 0.0
var e_special_cd := 0.0
var p_hit_flash := 0.0
var e_hit_flash := 0.0
var p_special_cd := 0.0
var e_facing := -1.0
var p_facing := 1.0
var result_text := ""
var result_clock := 0.0
var round_number := 1
var hunter_round_wins := 0
var demon_round_wins := 0
var match_draws := 0
var match_over := false
var last_round_winner := "draw"
var stage_names: Array[String] = []
var stage_textures: Array[Texture2D] = []
var stage_idx := 0
var story_mode := false
var story_chapter := 1
var story_intro_clock := 0.0
var showcase_names: Array[String] = []
var showcase_frames: Array[Array] = []

func _ready() -> void:
    font = ThemeDB.fallback_font
    menu_background = load("res://assets/main_menu_background.png") as Texture2D
    sound_player = AudioStreamPlayer.new()
    add_child(sound_player)
    menu_music_player = AudioStreamPlayer.new()
    menu_music_player.name = "MenuMusicPlayer"
    var music_stream := load("res://audio/menu_music.mp3") as AudioStreamMP3
    if music_stream != null:
        music_stream.loop = true
        music_stream.loop_offset = 0.0
        menu_music_player.stream = music_stream
    else:
        push_warning("Menu music could not be loaded: res://audio/menu_music.mp3")
    menu_music_player.volume_db = -3.0
    menu_music_player.bus = "Master"
    add_child(menu_music_player)
    if menu_music_player.stream != null:
        menu_music_player.play()

    # Every fighter in this build lives in assets/characters. Classify them
    # by name so newly added sprites are discovered automatically.
    var all_characters: Array[String] = CHARACTER_FOLDERS.duplicate()
    for character_name in all_characters:
        if _is_demon(character_name):
            demons.append(character_name)
        else:
            hunters.append(character_name)

    if hunters.is_empty():
        hunters = all_characters.duplicate()
    if demons.is_empty():
        demons = all_characters.duplicate()

    _refresh_selected()
    for name in hunters:
        var frames := _load_frames("res://assets/characters/" + name + "/")
        hunter_thumbs.append(frames[0] if not frames.is_empty() else null)
    for name in demons:
        var frames := _load_frames("res://assets/characters/" + name + "/")
        demon_thumbs.append(frames[0] if not frames.is_empty() else null)

    # Load the 29 Demon Slayer stages in their numbered filename order.
    # This makes stage selection deterministic across operating systems.
    var stage_path := "res://assets/29_escenarios_Demon_Slayer_Pixel_Art/"
    var stage_files: Array[String] = STAGE_FILES.duplicate()
    for stage_file in stage_files:
        var stage_texture := load(stage_path + stage_file) as Texture2D
        if stage_texture != null:
            stage_names.append(stage_file.get_basename().replace("_", " "))
            stage_textures.append(stage_texture)
    if stage_names.size() != 29:
        push_warning("Expected 29 stages, found " + str(stage_names.size()) + " in " + stage_path)

    # Featured characters shown in the upgraded main menu.
    var featured := ["Tanjiro_12_sprites_separados", "Muzan Kibutsuji_12_sprites_separados", "Mitsuri_12_sprites_separados", "Susamaru_12_sprites_separados"]
    for featured_name in featured:
        showcase_names.append(featured_name)
        showcase_frames.append(_load_frames("res://assets/characters/" + featured_name + "/"))
    queue_redraw()

func _is_demon(character_name: String) -> bool:
    var n := character_name.to_lower()
    return n.contains("demon") or n.contains("demonio") or n.contains("muzan") or n.contains("susamaru") or n.contains("yahaba") or n.contains("kyogai") or n.contains("swamp") or n.contains("horned")

func _list_folders(path: String) -> Array[String]:
    var out: Array[String] = []
    var dir := DirAccess.open(path)
    if dir == null: return out
    dir.list_dir_begin()
    var item := dir.get_next()
    while item != "":
        if dir.current_is_dir() and not item.begins_with("."):
            if not _load_frames(path + item + "/").is_empty(): out.append(item)
        item = dir.get_next()
    dir.list_dir_end()
    out.sort()
    return out

func _load_frames(path: String) -> Array[Texture2D]:
    var out: Array[Texture2D] = []
    # Use the manifest instead of DirAccess so sprites are found in exported EXE/PCK builds.
    var folder_name := path.trim_suffix("/").get_file()
    var files: Array = CHARACTER_FRAME_FILES.get(folder_name, [])
    for f in files:
        var tex := load(path + str(f)) as Texture2D
        if tex != null:
            out.append(tex)
    if out.is_empty():
        push_warning("No PNG sprites found in manifest for: " + path)
    return out

func _refresh_selected() -> void:
    # All character sprites, including demons, are stored in assets/characters.
    if not hunters.is_empty():
        hunter_frames = _load_frames("res://assets/characters/" + hunters[hunter_idx] + "/")
    else:
        hunter_frames.clear()
    if not demons.is_empty():
        demon_frames = _load_frames("res://assets/characters/" + demons[demon_idx] + "/")
    else:
        demon_frames.clear()
    p_frame = 0
    e_frame = 0

func _start_fight() -> void:
    if state != "result":
        hunter_round_wins = 0
        demon_round_wins = 0
        match_draws = 0
        round_number = 1
        match_over = false
    else:
        round_number += 1
    _refresh_selected()
    p_pos = Vector2(350, FLOOR_Y)
    e_pos = Vector2(930, FLOOR_Y)
    p_vel_y = 0.0
    e_vel_y = 0.0
    p_hp = MAX_HP
    e_hp = MAX_HP
    timer = 60.0
    p_attack_cd = 0.0
    e_attack_cd = 0.0
    p_special_cd = 0.0
    p_facing = 1.0
    e_facing = -1.0
    state = "fight"
    story_intro_clock = 2.0 if story_mode else 0.0

func _key_down_any(keycodes: Array[int]) -> bool:
    for keycode in keycodes:
        if Input.is_key_pressed(keycode) or Input.is_physical_key_pressed(keycode):
            return true
    return false

func _input(event: InputEvent) -> void:
    if event is InputEventKey and event.pressed and not event.echo and event.keycode == KEY_ESCAPE:
        if state == "menu":
            get_tree().quit()
        elif state == "select":
            state = "menu"
        elif state == "stage_select":
            state = "select"
        elif state == "fight" or state == "result":
            state = "menu"
            story_mode = false
        queue_redraw()

func _process(delta: float) -> void:
    if state == "menu":
        if Input.is_action_just_pressed("ui_up") or Input.is_key_pressed(KEY_W): menu_idx = posmod(menu_idx - 1, 4)
        if Input.is_action_just_pressed("ui_down") or Input.is_key_pressed(KEY_S): menu_idx = posmod(menu_idx + 1, 4)
        if Input.is_action_just_pressed("ui_accept") or Input.is_key_pressed(KEY_ENTER):
            _play_sfx("menu")
            if menu_idx == 0:
                story_mode = false
                multiplayer_local = true
                state = "select"
            elif menu_idx == 1:
                story_mode = false
                multiplayer_local = false
                state = "select"
            elif menu_idx == 2:
                story_mode = true
                story_chapter = 1
                multiplayer_local = false
                state = "select"
            else:
                get_tree().quit()
    elif state == "select":
        if Input.is_action_just_pressed("ui_left") or Input.is_key_pressed(KEY_A):
            hunter_idx = posmod(hunter_idx - 1, max(1, hunters.size()))
            _refresh_selected()
            _play_sfx("menu")
        if Input.is_action_just_pressed("ui_right") or Input.is_key_pressed(KEY_D):
            hunter_idx = posmod(hunter_idx + 1, max(1, hunters.size()))
            _refresh_selected()
            _play_sfx("menu")
        if Input.is_action_just_pressed("ui_up") or Input.is_key_pressed(KEY_W):
            demon_idx = posmod(demon_idx - 1, max(1, demons.size()))
            _refresh_selected()
            _play_sfx("menu")
        if Input.is_action_just_pressed("ui_down") or Input.is_key_pressed(KEY_S):
            demon_idx = posmod(demon_idx + 1, max(1, demons.size()))
            _refresh_selected()
            _play_sfx("menu")
        var p2_select_left := _key_down_any([KEY_KP_4])
        var p2_select_right := _key_down_any([KEY_KP_6])
        if multiplayer_local and p2_select_left and not p2_select_left_was_down:
            demon_idx = posmod(demon_idx - 1, max(1, demons.size()))
            _refresh_selected()
            _play_sfx("menu")
        if multiplayer_local and p2_select_right and not p2_select_right_was_down:
            demon_idx = posmod(demon_idx + 1, max(1, demons.size()))
            _refresh_selected()
            _play_sfx("menu")
        p2_select_left_was_down = p2_select_left
        p2_select_right_was_down = p2_select_right
        if Input.is_action_just_pressed("ui_accept") or Input.is_key_pressed(KEY_F):
            _play_sfx("menu")
            state = "stage_select"
        if Input.is_action_just_pressed("ui_cancel"):
            _play_sfx("menu")
            state = "menu"
    elif state == "stage_select":
        # Play a short selection sound every time the highlighted stage changes.
        if Input.is_action_just_pressed("ui_left") or Input.is_key_pressed(KEY_A):
            stage_idx = posmod(stage_idx - 1, max(1, stage_names.size()))
            _play_sfx("menu")
        if Input.is_action_just_pressed("ui_right") or Input.is_key_pressed(KEY_D):
            stage_idx = posmod(stage_idx + 1, max(1, stage_names.size()))
            _play_sfx("menu")
        if Input.is_action_just_pressed("ui_accept") or Input.is_key_pressed(KEY_F):
            _play_sfx("menu")
            _start_fight()
        if Input.is_action_just_pressed("ui_cancel"):
            _play_sfx("menu")
            state = "select"
    elif state == "fight":
        _update_fight(delta)
        if story_intro_clock > 0.0: story_intro_clock = maxf(0.0, story_intro_clock - delta)
    elif state == "result":
        result_clock -= delta
        p_anim += delta
        e_anim += delta
        if p_anim > 0.13:
            p_anim = 0.0
            if not hunter_frames.is_empty(): p_frame = (p_frame + 1) % hunter_frames.size()
        if e_anim > 0.13:
            e_anim = 0.0
            if not demon_frames.is_empty(): e_frame = (e_frame + 1) % demon_frames.size()
        if Input.is_action_just_pressed("ui_accept") or Input.is_key_pressed(KEY_F):
            if not match_over:
                _start_fight()
            elif story_mode and hunter_round_wins >= 3 and not demons.is_empty():
                story_chapter += 1
                demon_idx = posmod(demon_idx + 1, demons.size())
                _refresh_selected()
                state = "stage_select"
            else:
                state = "select"
    if menu_music_player != null and menu_music_player.stream != null:
        if state == "menu":
            if not menu_music_player.playing:
                menu_music_player.play()
        elif menu_music_player.playing:
            menu_music_player.stop()
    queue_redraw()

func _update_fight(delta: float) -> void:
    timer = maxf(0.0, timer - delta)
    p_attack_cd = maxf(0.0, p_attack_cd - delta)
    e_attack_cd = maxf(0.0, e_attack_cd - delta)
    e_special_cd = maxf(0.0, e_special_cd - delta)
    p_special_cd = maxf(0.0, p_special_cd - delta)
    p_hit_flash = maxf(0.0, p_hit_flash - delta)
    e_hit_flash = maxf(0.0, e_hit_flash - delta)
    p_anim += delta
    e_anim += delta
    if p_anim > 0.13:
        p_anim = 0.0
        if not hunter_frames.is_empty(): p_frame = (p_frame + 1) % hunter_frames.size()
    if e_anim > 0.16:
        e_anim = 0.0
        if not demon_frames.is_empty(): e_frame = (e_frame + 1) % demon_frames.size()

    var axis := 0.0
    if Input.is_key_pressed(KEY_A) or (not multiplayer_local and Input.is_key_pressed(KEY_LEFT)): axis -= 1.0
    if Input.is_key_pressed(KEY_D) or (not multiplayer_local and Input.is_key_pressed(KEY_RIGHT)): axis += 1.0
    p_pos.x += axis * WALK_SPEED * delta
    if axis != 0: p_facing = signf(axis)
    if Input.is_key_pressed(KEY_W) and p_pos.y >= FLOOR_Y - 1:
        p_vel_y = JUMP_SPEED
        _play_sfx("jump")
    if Input.is_key_pressed(KEY_F) and p_attack_cd <= 0.0: _player_attack(false)
    if Input.is_key_pressed(KEY_G) and p_special_cd <= 0.0: _player_attack(true)

    var dist := e_pos.x - p_pos.x
    p_facing = 1.0 if dist >= 0.0 else -1.0
    e_facing = -1.0 if dist >= 0.0 else 1.0
    if multiplayer_local:
        # Player 2: arrows or numeric keypad (4/6 move, 8 jump, 1 hit, 3 special).
        var axis2 := 0.0
        if _key_down_any([KEY_LEFT, KEY_KP_4]): axis2 -= 1.0
        if _key_down_any([KEY_RIGHT, KEY_KP_6]): axis2 += 1.0
        e_pos.x += axis2 * WALK_SPEED * delta
        if _key_down_any([KEY_UP, KEY_KP_8]) and e_pos.y >= FLOOR_Y - 1:
            e_vel_y = JUMP_SPEED
            _play_sfx("jump")
        # Keypad actions support NumLock on/off; top-row 1/3 are optional fallbacks.
        var p2_hit_pressed := _key_down_any([KEY_K, KEY_KP_1, KEY_END, KEY_1])
        var p2_special_pressed := _key_down_any([KEY_L, KEY_KP_3, KEY_PAGEDOWN, KEY_3])
        if p2_hit_pressed and e_attack_cd <= 0.0:
            e_attack_cd = 0.34
            # e_facing points toward Player 1; dist's sign points from Player 1 to Player 2.
            if absf(dist) < 150.0 and signf(dist) == -e_facing:
                p_hp = maxi(0, p_hp - randi_range(7, 13))
                p_hit_flash = 0.2
                _play_sfx("hit")
            else:
                _play_sfx("swing")
        if p2_special_pressed and e_special_cd <= 0.0:
            e_special_cd = 0.95
            if absf(dist) < 245.0 and signf(dist) == -e_facing:
                p_hp = maxi(0, p_hp - randi_range(16, 24))
                p_hit_flash = 0.24
                _play_sfx("special")
            else:
                _play_sfx("swing")
    else:
        # Rival controlado por la computadora.
        if absf(dist) > 115.0:
            e_pos.x -= signf(dist) * 205.0 * delta
        elif e_attack_cd <= 0.0:
            e_attack_cd = 1.0
            if randf() < 0.72 and absf(dist) < 150.0:
                p_hp = maxi(0, p_hp - randi_range(7, 12))
                p_hit_flash = 0.2
                p_pos.x -= e_facing * 24.0
                _play_sfx("hit")

    p_vel_y += GRAVITY * delta
    p_pos.y += p_vel_y * delta
    if p_pos.y > FLOOR_Y:
        p_pos.y = FLOOR_Y
        p_vel_y = 0.0
    e_vel_y += GRAVITY * delta
    e_pos.y += e_vel_y * delta
    if e_pos.y > FLOOR_Y:
        e_pos.y = FLOOR_Y
        e_vel_y = 0.0
    p_pos.x = clampf(p_pos.x, 70.0, 1210.0)
    e_pos.x = clampf(e_pos.x, 70.0, 1210.0)
    if p_hp <= 0: _finish_round("¡GANA " + _pretty(demons[demon_idx]) + "!")
    elif e_hp <= 0: _finish_round("¡VICTORIA DE " + _pretty(hunters[hunter_idx]) + "!")
    elif timer <= 0.0:
        if p_hp > e_hp: _finish_round("¡VICTORIA DEL CAZADOR!")
        elif e_hp > p_hp: _finish_round("¡GANA EL DEMONIO!")
        else: _finish_round("¡EMPATE!")

func _player_attack(special: bool) -> void:
    if special:
        p_special_cd = 2.2
        p_attack_cd = 0.5
    else:
        p_attack_cd = 0.34
    var dist := e_pos.x - p_pos.x
    if absf(dist) < (245.0 if special else 150.0) and signf(dist) == p_facing:
        var damage := randi_range(16, 24) if special else randi_range(7, 13)
        e_hp = maxi(0, e_hp - damage)
        e_hit_flash = 0.24
        e_pos.x += p_facing * (48.0 if special else 22.0)
        _play_sfx("special" if special else "hit")
    else:
        _play_sfx("special" if special else "swing")

func _finish_round(message: String) -> void:
    if state == "result":
        return
    var hunter_won := e_hp <= 0 or (timer <= 0.0 and p_hp > e_hp)
    var demon_won := p_hp <= 0 or (timer <= 0.0 and e_hp > p_hp)
    if hunter_won:
        last_round_winner = "hunter"
        hunter_round_wins = mini(3, hunter_round_wins + 1)
        match_over = hunter_round_wins >= 3
        if match_over:
            result_text = "MATCH OVER • " + _short_name(_pretty(hunters[hunter_idx])) + " WINS  " + str(hunter_round_wins) + " - " + str(demon_round_wins)
        else:
            result_text = "ROUND " + str(round_number) + " • " + _short_name(_pretty(hunters[hunter_idx])) + " WINS  " + str(hunter_round_wins) + " - " + str(demon_round_wins)
    elif demon_won:
        last_round_winner = "demon"
        demon_round_wins = mini(3, demon_round_wins + 1)
        match_over = demon_round_wins >= 3
        if match_over:
            result_text = "MATCH OVER • " + _short_name(_pretty(demons[demon_idx])) + " WINS  " + str(demon_round_wins) + " - " + str(hunter_round_wins)
        else:
            result_text = "ROUND " + str(round_number) + " • " + _short_name(_pretty(demons[demon_idx])) + " WINS  " + str(demon_round_wins) + " - " + str(hunter_round_wins)
    else:
        last_round_winner = "draw"
        match_draws += 1
        match_over = false
        result_text = "ROUND DRAW  •  " + str(hunter_round_wins) + " - " + str(demon_round_wins)
    state = "result"
    result_clock = 1.0

func _pretty(s: String) -> String:
    return s.replace("_", " ")

func _draw() -> void:
    _draw_arena_background()
    if state == "menu": _draw_menu()
    elif state == "select": _draw_select()
    elif state == "stage_select": _draw_stage_select()
    elif state == "fight":
        _draw_fight()
        if story_mode and story_intro_clock > 0.0: _draw_story_intro()
    elif state == "result": _draw_result()

func _draw_arena_background() -> void:
    if (state == "fight" or state == "result") and stage_idx >= 0 and stage_idx < stage_textures.size() and stage_textures[stage_idx] != null:
        draw_texture_rect(stage_textures[stage_idx], Rect2(0, 0, W, H), false)
        draw_rect(Rect2(0, 0, W, H), Color(0.015, 0.025, 0.05, 0.30), true)
        draw_rect(Rect2(0, 485, W, 235), Color(0.02, 0.03, 0.06, 0.46), true)
        draw_line(Vector2(0, FLOOR_Y+15), Vector2(W, FLOOR_Y+15), Color("#e0a35b"), 2.0)
        return
    draw_rect(Rect2(0, 0, W, H), Color("#071322"), true)
    # Luna, montañas, templo y suelo pixelado dibujados por Godot.
    draw_circle(Vector2(640, 150), 74, Color("#c5d8e5"))
    draw_circle(Vector2(640, 150), 63, Color("#e2e8ed"))
    for i in range(9):
        var x := float(i) * 170.0 - 20.0
        draw_colored_polygon(PackedVector2Array([Vector2(x, 370), Vector2(x+90, 245 + float((i%3)*22)), Vector2(x+185, 370)]), Color("#102438"))
    draw_rect(Rect2(0, 350, W, 145), Color("#10202b"), true)
    # Faroles cálidos a los lados.
    for x in [55.0, 160.0, 1120.0, 1220.0]:
        draw_rect(Rect2(x, 285, 5, 105), Color("#3b2d27"), true)
        draw_rect(Rect2(x-12, 295, 29, 37), Color("#f0a34b"), true)
        draw_rect(Rect2(x-7, 300, 19, 27), Color("#ffd78a"), true)
    draw_rect(Rect2(0, 490, W, 230), Color("#161d2b"), true)
    for x in range(0, 1280, 64):
        draw_line(Vector2(x, 490), Vector2(x-75, 720), Color("#293342"), 2.0)
    for y in range(515, 720, 43): draw_line(Vector2(0, y), Vector2(W, y), Color("#293342"), 1.0)
    draw_line(Vector2(0, FLOOR_Y+15), Vector2(W, FLOOR_Y+15), Color("#e0a35b"), 2.0)

func _draw_menu() -> void:
    # Custom main menu artwork supplied by the user.
    if menu_background != null:
        draw_texture_rect(menu_background, Rect2(0, 0, W, H), false)
    else:
        draw_rect(Rect2(0, 0, W, H), Color("#111323"), true)

    # The artwork already contains the DEMON SLAYER logo, four featured
    # characters, and menu labels. Only draw a focus frame for keyboard navigation.
    # Match the selection frame to the button artwork embedded in the background.
    # Keep the frame inside the gold borders so it never spills over the next row.
    # Coordinates match the button borders in the 800x422 menu artwork,
    # scaled to the 1280x720 game canvas. Outline only: do not cover the labels.
    var button_rects := [
        Rect2(382, 338, 516, 58),
        Rect2(382, 408, 516, 56),
        Rect2(382, 473, 516, 57),
        Rect2(382, 538, 516, 60)
    ]
    if menu_idx >= 0 and menu_idx < button_rects.size():
        var selected_rect: Rect2 = button_rects[menu_idx]
        draw_rect(selected_rect, Color("#ffe0a0"), false, 2.0)


func _draw_select() -> void:
    # Pixel-art Demon Slayer character select: blue hunters vs red demons.
    draw_rect(Rect2(0, 0, W, H), Color("#05091c"), true)
    # Night-sky glow and distant temple silhouettes.
    draw_rect(Rect2(0, 0, W, 430), Color("#101746"), true)
    draw_circle(Vector2(640, 265), 92, Color("#8ab9ff", 0.10))
    draw_circle(Vector2(640, 265), 70, Color("#c6dcff", 0.12))
    for i in range(12):
        var bx := float(i) * 118.0
        draw_colored_polygon(PackedVector2Array([
            Vector2(bx, 340), Vector2(bx + 55, 275 + float(i % 3) * 18),
            Vector2(bx + 118, 340)
        ]), Color("#171b49"))
        draw_rect(Rect2(bx + 28, 310, 5, 25), Color("#4e2862"))
        draw_rect(Rect2(bx + 22, 304, 17, 7), Color("#f5a54b", 0.75))
    # Pixel-like blue/red energy at the sides.
    for i in range(22):
        var yy := float((i * 37) % 390)
        var lx := float((i * 19) % 150)
        var rx := W - lx - 8
        draw_rect(Rect2(lx, yy, 4 + float(i % 3) * 3, 4 + float(i % 4) * 2), Color("#168bff", 0.55), true)
        draw_rect(Rect2(rx, yy, 4 + float(i % 3) * 3, 4 + float(i % 4) * 2), Color("#ff174d", 0.55), true)
    # Three match-stat boxes.
    _draw_neon_panel(Rect2(405, 10, 145, 78), Color("#ff285c"), Color("#260817"))
    _draw_neon_panel(Rect2(568, 10, 145, 78), Color("#ffd447"), Color("#241d08"))
    _draw_neon_panel(Rect2(730, 10, 145, 78), Color("#168bff"), Color("#07172d"))
    draw_string(font, Vector2(405, 48), str(hunter_round_wins), HORIZONTAL_ALIGNMENT_CENTER, 145, 31, Color("#ffffff"))
    draw_string(font, Vector2(405, 75), "VICTORIAS", HORIZONTAL_ALIGNMENT_CENTER, 145, 15, Color("#ffb7c9"))
    draw_string(font, Vector2(568, 48), str(match_draws), HORIZONTAL_ALIGNMENT_CENTER, 145, 31, Color("#ffffff"))
    draw_string(font, Vector2(568, 75), "EMPATES", HORIZONTAL_ALIGNMENT_CENTER, 145, 15, Color("#ffe99a"))
    draw_string(font, Vector2(730, 48), str(demon_round_wins), HORIZONTAL_ALIGNMENT_CENTER, 145, 31, Color("#ffffff"))
    draw_string(font, Vector2(730, 75), "VICTORIAS", HORIZONTAL_ALIGNMENT_CENTER, 145, 15, Color("#9ddfff"))
    # Main title in a beveled cyan frame.
    draw_rect(Rect2(300, 102, 680, 66), Color("#04152f"), true)
    draw_rect(Rect2(300, 102, 680, 66), Color("#00cfff"), false, 4.0)
    draw_rect(Rect2(310, 110, 660, 50), Color("#0b2a58"), false, 2.0)
    _center_text("‹  SELECCIÓN DE PERSONAJE  ›", 147, 32, Color("#f5fbff"))
    # Wide two-row character roster, with a blue hunter half and red demon half.
    _draw_neon_panel(Rect2(42, 326, 595, 174), Color("#008dff"), Color("#04152c"))
    _draw_neon_panel(Rect2(643, 326, 595, 174), Color("#ff285c"), Color("#260817"))
    _draw_roster(hunters, false)
    _draw_roster(demons, true)
    # Large selected sprite frames and name banners.
    _draw_preview(hunter_frames, Vector2(155, 588), hunter_idx, hunters, false)
    _draw_preview(demon_frames, Vector2(1125, 588), demon_idx, demons, true)
    var hunter_name := _short_name(_pretty(hunters[hunter_idx])) if not hunters.is_empty() else "CAZADOR"
    var demon_name := _short_name(_pretty(demons[demon_idx])) if not demons.is_empty() else "DEMONIO"
    draw_rect(Rect2(300, 540, 340, 82), Color("#04152c"), true)
    draw_rect(Rect2(300, 540, 340, 82), Color("#008dff"), false, 3.0)
    draw_rect(Rect2(640, 540, 340, 82), Color("#260817"), true)
    draw_rect(Rect2(640, 540, 340, 82), Color("#ff285c"), false, 3.0)
    draw_string(font, Vector2(305, 576), hunter_name, HORIZONTAL_ALIGNMENT_CENTER, 330, 24, Color("#f3fbff"))
    draw_string(font, Vector2(305, 608), "CAZADOR", HORIZONTAL_ALIGNMENT_CENTER, 330, 18, Color("#00e5ff"))
    draw_string(font, Vector2(645, 576), demon_name, HORIZONTAL_ALIGNMENT_CENTER, 330, 24, Color("#fff0f3"))
    draw_string(font, Vector2(645, 608), "DEMONIO", HORIZONTAL_ALIGNMENT_CENTER, 330, 18, Color("#ff285c"))
    # Bottom controller guide.
    draw_rect(Rect2(120, 654, 1040, 48), Color("#030d24"), true)
    draw_rect(Rect2(120, 654, 1040, 48), Color("#087cff"), false, 3.0)
    _center_text("✥ ELEGIR     A / D: CAZADOR     4 / 6: DEMONIO     ENTER / F: PELEAR     ESC: ATRÁS", 684, 16, Color("#d9f4ff"))

func _draw_neon_panel(rect: Rect2, accent: Color, fill: Color) -> void:
    draw_rect(rect, fill, true)
    draw_rect(rect, accent, false, 3.0)
    draw_rect(Rect2(rect.position.x + 5, rect.position.y + 5, rect.size.x - 10, rect.size.y - 10), Color(accent.r, accent.g, accent.b, 0.35), false, 1.0)
    var x := rect.position.x
    var y := rect.position.y
    var r := rect.position.x + rect.size.x
    var b := rect.position.y + rect.size.y
    draw_line(Vector2(x, y + 20), Vector2(x + 20, y), accent, 4.0, true)
    draw_line(Vector2(r - 20, y), Vector2(r, y + 20), accent, 4.0, true)
    draw_line(Vector2(x, b - 20), Vector2(x + 20, b), accent, 4.0, true)
    draw_line(Vector2(r - 20, b), Vector2(r, b - 20), accent, 4.0, true)

func _draw_roster(names: Array[String], is_demon: bool) -> void:
    var start_x := 49.0 if not is_demon else 650.0
    var selected := demon_idx if is_demon else hunter_idx
    var accent := Color("#ff285c") if is_demon else Color("#00bfff")
    for i in range(names.size()):
        var col := i % 7
        var row := int(i / 7)
        var x := start_x + float(col) * 83.0
        var y := 336.0 + float(row) * 83.0
        var chosen := i == selected
        var card := Rect2(x, y, 77, 76)
        draw_rect(card, Color("#0a2140") if not chosen else (Color("#073b59") if not is_demon else Color("#58132d")), true)
        if chosen:
            draw_rect(Rect2(x - 3, y - 3, 83, 82), Color(accent.r, accent.g, accent.b, 0.22), true)
        draw_rect(card, accent if chosen else Color("#245c8d") if not is_demon else Color("#85304b"), false, 3.0 if chosen else 1.0)
        var thumb: Texture2D = (demon_thumbs[i] if is_demon else hunter_thumbs[i])
        if thumb != null:
            draw_texture_rect(thumb, Rect2(x + 9, y + 4, 59, 50), false)
        var label := _short_name(names[i])
        draw_string(font, Vector2(x + 3, y + 69), label, HORIZONTAL_ALIGNMENT_LEFT, 71, 9, Color("#f1f7ff"))
        if chosen:
            draw_rect(Rect2(x + 2, y + 2, 9, 3), accent, true)
            draw_rect(Rect2(x + 2, y + 2, 3, 9), accent, true)

func _draw_preview(frames: Array[Texture2D], pos: Vector2, idx: int, names: Array[String], is_demon: bool) -> void:
    var c := Color("#ff285c") if is_demon else Color("#00bfff")
    var card := Rect2(pos.x - 78, pos.y - 83, 156, 128)
    draw_rect(Rect2(card.position.x - 4, card.position.y - 4, card.size.x + 8, card.size.y + 8), Color(c.r, c.g, c.b, 0.15), true)
    draw_rect(card, Color("#07152b"), true)
    draw_rect(card, c, false, 3.0)
    draw_rect(Rect2(card.position.x + 7, card.position.y + 7, card.size.x - 14, card.size.y - 14), Color(c.r, c.g, c.b, 0.25), false, 1.0)
    if not frames.is_empty():
        var frame_index := p_frame if not is_demon else e_frame
        var tex := frames[mini(frame_index, frames.size() - 1)]
        draw_texture_rect(tex, Rect2(pos.x - 70, pos.y - 80, 140, 115), false)
func _draw_stage_select() -> void:
    draw_rect(Rect2(22, 18, 1236, 684), Color(0.015, 0.025, 0.05, 0.92), true)
    draw_rect(Rect2(22, 18, 1236, 684), Color("#b68b4b"), false, 2.0)
    _center_text("SELECCIÓN DE ESCENARIO • " + str(stage_names.size()) + " ESCENARIOS", 60, 32, Color("#fff0d8"))
    if stage_textures.size() > 0 and stage_textures[stage_idx] != null:
        draw_texture_rect(stage_textures[stage_idx], Rect2(210, 105, 860, 430), false)
        draw_rect(Rect2(210, 105, 860, 430), Color("#f1c36c"), false, 3.0)
    _center_text(("ESCENARIO " + str(stage_idx + 1) + " DE " + str(stage_names.size()) + "  •  " + stage_names[stage_idx]) if not stage_names.is_empty() and stage_idx < stage_names.size() else "NO HAY ESCENARIOS", 580, 22, Color("#ffe5a2"))
    _center_text("A/D O ←/→: CAMBIAR ESCENARIO    ENTER/F: COMENZAR    ESC: ATRÁS", 642, 17, Color.WHITE)
    if story_mode: _center_text("HISTORIA • CAPÍTULO " + str(story_chapter), 680, 16, Color("#ff8b9b"))

func _draw_story_intro() -> void:
    draw_rect(Rect2(0, 120, W, 95), Color(0.01, 0.02, 0.04, 0.80), true)
    _center_text("HISTORIA • CAPÍTULO " + str(story_chapter), 157, 26, Color("#ffe5a2"))
    _center_text(_short_name(_pretty(hunters[hunter_idx])) + " VS " + _short_name(_pretty(demons[demon_idx])), 192, 19, Color.WHITE)

func _draw_result() -> void:
    _draw_fight()
    draw_rect(Rect2(0, 0, W, H), Color(0.01, 0.02, 0.04, 0.76), true)
    var winner_is_hunter := e_hp <= 0 or (timer <= 0.0 and p_hp > e_hp)
    var winner_frames: Array[Texture2D] = hunter_frames if winner_is_hunter else demon_frames
    var winner_pos := Vector2(640, 355)
    if not winner_frames.is_empty():
        var tex := winner_frames[mini(p_frame if winner_is_hunter else e_frame, winner_frames.size()-1)]
        draw_texture_rect(tex, Rect2(winner_pos.x-125, winner_pos.y-150, 250, 250), false)
    for i in range(24):
        var x := float((i * 97 + int(Time.get_ticks_msec() / 8)) % 1280)
        var y := float((i * 53 + int(Time.get_ticks_msec() / 5)) % 430)
        draw_rect(Rect2(x, y, 5, 9), Color("#f5c56b") if i % 2 == 0 else Color("#ff6680"), true)
    _center_text(result_text, 145, 34, Color("#ffe5a2"))
    _center_text("VICTORIA • " + _short_name(_pretty(hunters[hunter_idx] if winner_is_hunter else demons[demon_idx])), 535, 24, Color.WHITE)
    var result_action := "SIGUIENTE CAPÍTULO" if (story_mode and match_over and hunter_round_wins >= 3) else ("SELECCIÓN DE PERSONAJES" if match_over else "SIGUIENTE RONDA")
    _center_text("ENTER / F: " + result_action + "     ESC: MENÚ", 600, 18, Color("#a8e7ff"))
    _center_text("PUNTOS DE PARTIDA: " + str(hunter_round_wins) + " - " + str(demon_round_wins) + "  •  PRIMERO A 3 GANA", 632, 17, Color("#ffe5a2"))

func _draw_fight() -> void:
    # HUD tipo juego de lucha: barras simétricas, tiempo, retratos y nombres.
    draw_rect(Rect2(0, 0, W, 108), Color(0.015, 0.025, 0.05, 0.93), true)
    draw_string(font, Vector2(38, 34), _short_name(_pretty(hunters[hunter_idx])), HORIZONTAL_ALIGNMENT_LEFT, 350, 22, Color("#72e5ff"))
    draw_string(font, Vector2(925, 34), _short_name(_pretty(demons[demon_idx])), HORIZONTAL_ALIGNMENT_RIGHT, 315, 22, Color("#ff7a83"))
    # Three round markers on each side, inspired by classic fighting-game HUDs.
    # They sit below each health bar and remain visible throughout the fight.
    # Each pip lights after a round win. First to three pips wins the match.
    var hunter_lit_dots := hunter_round_wins
    var demon_lit_dots := demon_round_wins
    for round_dot in range(3):
        var left_dot := Vector2(505.0 + float(round_dot) * 27.0, 91.0)
        var right_dot := Vector2(775.0 + float(round_dot) * 27.0, 91.0)
        var left_on := round_dot < hunter_lit_dots
        var right_on := round_dot < demon_lit_dots
        draw_circle(left_dot, 10.0, Color("#17202b"))
        draw_circle(left_dot, 7.0, Color("#6de7ff") if left_on else Color("#27323c"))
        draw_circle(left_dot, 10.0, Color("#d7e8f4") if left_on else Color("#59616a"), false, 2.0, true)
        draw_circle(right_dot, 10.0, Color("#17202b"))
        draw_circle(right_dot, 7.0, Color("#ff6677") if right_on else Color("#27323c"))
        draw_circle(right_dot, 10.0, Color("#d7e8f4") if right_on else Color("#59616a"), false, 2.0, true)
    draw_rect(Rect2(38, 47, 500, 27), Color("#4b202b"), true)
    draw_rect(Rect2(38, 47, 500.0 * float(p_hp) / MAX_HP, 27), Color("#35d5a1"), true)
    draw_rect(Rect2(742, 47, 500, 27), Color("#4b202b"), true)
    draw_rect(Rect2(742 + 500.0 * (1.0 - float(e_hp) / MAX_HP), 47, 500.0 * float(e_hp) / MAX_HP, 27), Color("#f04d64"), true)
    draw_rect(Rect2(38, 47, 500, 27), Color("#d7e8f4"), false, 2.0)
    draw_rect(Rect2(742, 47, 500, 27), Color("#d7e8f4"), false, 2.0)
    draw_rect(Rect2(590, 14, 100, 66), Color("#172334"), true)
    draw_rect(Rect2(590, 14, 100, 66), Color("#e3b35e"), false, 2.0)
    _center_text(str(int(ceil(timer))), 60, 36, Color("#fff0d0"))
    # Sombras bajo los luchadores.
    draw_ellipse_placeholder(Vector2(p_pos.x, FLOOR_Y+15), Vector2(48, 10), Color(0.0, 0.0, 0.0, 0.35))
    draw_ellipse_placeholder(Vector2(e_pos.x, FLOOR_Y+15), Vector2(48, 10), Color(0.0, 0.0, 0.0, 0.35))
    _draw_fighter(hunter_frames, p_frame, p_pos, p_facing, p_hit_flash, Color("#62dcff"))
    _draw_fighter(demon_frames, e_frame, e_pos, e_facing, e_hit_flash, Color("#ff4058"))
    if p_attack_cd > 0.15:
        var hunter_power := _power_color(hunters[hunter_idx] if not hunters.is_empty() else "tanjiro")
        draw_arc(p_pos + Vector2(p_facing*65, -75), 60, -1.0, 1.0, 24, hunter_power, 6.0, true)
        if p_special_cd > 1.7:
            draw_arc(p_pos + Vector2(p_facing*90, -90), 92, -1.15, 1.15, 30, Color(hunter_power, 0.55), 11.0, true)
    if e_attack_cd > 0.72:
        var demon_power := _power_color(demons[demon_idx] if not demons.is_empty() else "muzan")
        draw_arc(e_pos + Vector2(e_facing*60, -70), 50, 2.0, 4.2, 24, demon_power, 5.0, true)
    draw_rect(Rect2(18, 625, 400, 76), Color(0.01, 0.02, 0.04, 0.78), true)
    draw_string(font, Vector2(34, 652), "J1: F GOLPE   G TÉCNICA", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color.WHITE)
    draw_string(font, Vector2(34, 681), "A/D MOVER   W SALTAR", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color("#c9d8e8"))
    draw_rect(Rect2(860, 625, 400, 76), Color(0.01, 0.02, 0.04, 0.78), true)
    draw_string(font, Vector2(885, 654), "J2: NUM 1 GOLPE   NUM 3 TÉCNICA" if multiplayer_local else "RIVAL CONTROLADO POR IA", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color("#ff9ba3"))
    draw_string(font, Vector2(885, 681), "NUM 4/6 MOVER   NUM 8 SALTAR" if multiplayer_local else "Derrota su barra de vida para ganar", HORIZONTAL_ALIGNMENT_LEFT, -1, 15, Color("#c9d8e8"))

func _draw_fighter(frames: Array[Texture2D], frame: int, pos: Vector2, facing: float, flash: float, accent: Color) -> void:
    if frames.is_empty():
        draw_rect(Rect2(pos.x-25, pos.y-120, 50, 120), accent, true)
        return
    var tex := frames[mini(frame, frames.size()-1)]
    var size := Vector2(190, 190)
    var rect := Rect2(pos.x-size.x/2, pos.y-size.y+18, size.x, size.y)
    if flash > 0.0:
        draw_rect(Rect2(rect.position-Vector2(4,4), rect.size+Vector2(8,8)), Color.WHITE, false, 4.0)
    draw_texture_rect(tex, rect, false)

func draw_ellipse_placeholder(center: Vector2, radius: Vector2, color: Color) -> void:
    draw_set_transform(center, 0.0, Vector2(radius.x, radius.y))
    draw_circle(Vector2.ZERO, 1.0, color)
    draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)

func _center_text(text: String, y: int, size: int, color: Color) -> void:
    var width := font.get_string_size(text, HORIZONTAL_ALIGNMENT_LEFT, -1, size).x
    draw_string(font, Vector2((W-width)/2.0, y), text, HORIZONTAL_ALIGNMENT_LEFT, -1, size, color)

func _short_name(s: String) -> String:
    var cleaned := s.replace("_", " ")
    if cleaned.length() > 17: return cleaned.substr(0, 16) + "…"
    return cleaned

func _power_color(character_name: String) -> Color:
    var n := character_name.to_lower()
    if n.contains("tanjiro") or n.contains("giyu"): return Color("#4bcfff")
    if n.contains("zenitsu"): return Color("#ffe45e")
    if n.contains("mitsuri"): return Color("#ff83c6")
    if n.contains("shinobu") or n.contains("kanae"): return Color("#c9a0ff")
    if n.contains("muzan") or n.contains("demon") or n.contains("susamaru"): return Color("#ff526b")
    if n.contains("rengoku"): return Color("#ff9a3c")
    return Color("#e8d7a1")

func _play_sfx(kind: String) -> void:
    if not sound_enabled or sound_player == null:
        return
    var path := "res://audio/" + kind + ".wav"
    if ResourceLoader.exists(path):
        var stream := load(path) as AudioStream
        if stream != null:
            sound_player.stream = stream
            sound_player.play()
