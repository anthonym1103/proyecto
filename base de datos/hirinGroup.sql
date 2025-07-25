PGDMP      6                }         
   hirinGroup    17.2    17.2 x    W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            Y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            Z           1262    41000 
   hirinGroup    DATABASE     �   CREATE DATABASE "hirinGroup" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Venezuela.1252';
    DROP DATABASE "hirinGroup";
                     postgres    false            �            1259    41212    banco    TABLE     �   CREATE TABLE public.banco (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    descripcion character varying(500) NOT NULL
);
    DROP TABLE public.banco;
       public         heap r       postgres    false            �            1259    41211    banco_id_seq    SEQUENCE     �   CREATE SEQUENCE public.banco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.banco_id_seq;
       public               postgres    false    240            [           0    0    banco_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.banco_id_seq OWNED BY public.banco.id;
          public               postgres    false    239            �            1259    41087    candidatoexperiencia    TABLE     �   CREATE TABLE public.candidatoexperiencia (
    id integer NOT NULL,
    usercandidato integer NOT NULL,
    idexperiencia integer NOT NULL
);
 (   DROP TABLE public.candidatoexperiencia;
       public         heap r       postgres    false            �            1259    41086    candidatoexperiencia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.candidatoexperiencia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.candidatoexperiencia_id_seq;
       public               postgres    false    225            \           0    0    candidatoexperiencia_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.candidatoexperiencia_id_seq OWNED BY public.candidatoexperiencia.id;
          public               postgres    false    224            �            1259    41173    candidatopostulacion    TABLE     �   CREATE TABLE public.candidatopostulacion (
    id integer NOT NULL,
    cedcandidato integer NOT NULL,
    idpostulacion integer NOT NULL,
    fecha character varying(20) NOT NULL
);
 (   DROP TABLE public.candidatopostulacion;
       public         heap r       postgres    false            �            1259    41172    candidatopostulacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.candidatopostulacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.candidatopostulacion_id_seq;
       public               postgres    false    235            ]           0    0    candidatopostulacion_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.candidatopostulacion_id_seq OWNED BY public.candidatopostulacion.id;
          public               postgres    false    234            �            1259    41123    candidatoprofesion    TABLE     �   CREATE TABLE public.candidatoprofesion (
    id integer NOT NULL,
    usercandidato integer NOT NULL,
    idprofesion integer NOT NULL
);
 &   DROP TABLE public.candidatoprofesion;
       public         heap r       postgres    false            �            1259    41122    candidatoprofesion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.candidatoprofesion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.candidatoprofesion_id_seq;
       public               postgres    false    229            ^           0    0    candidatoprofesion_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.candidatoprofesion_id_seq OWNED BY public.candidatoprofesion.id;
          public               postgres    false    228            �            1259    41189    empleado    TABLE     �   CREATE TABLE public.empleado (
    cedula integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellido character varying(20) NOT NULL,
    salario double precision NOT NULL
);
    DROP TABLE public.empleado;
       public         heap r       postgres    false            �            1259    41080    experiencialaboral    TABLE       CREATE TABLE public.experiencialaboral (
    id integer NOT NULL,
    empresa character varying(20) NOT NULL,
    fecha_inicio character varying(15) NOT NULL,
    fecha_finalizacion character varying(15) NOT NULL,
    cargo character varying(30) NOT NULL
);
 &   DROP TABLE public.experiencialaboral;
       public         heap r       postgres    false            �            1259    41079    experiencialaboral_id_seq    SEQUENCE     �   CREATE SEQUENCE public.experiencialaboral_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.experiencialaboral_id_seq;
       public               postgres    false    223            _           0    0    experiencialaboral_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.experiencialaboral_id_seq OWNED BY public.experiencialaboral.id;
          public               postgres    false    222            �            1259    41195    nomina    TABLE     �   CREATE TABLE public.nomina (
    id integer NOT NULL,
    idempresa integer NOT NULL,
    idempleado integer NOT NULL,
    mes integer NOT NULL,
    anio integer NOT NULL
);
    DROP TABLE public.nomina;
       public         heap r       postgres    false            �            1259    41194    nomina_id_seq    SEQUENCE     �   CREATE SEQUENCE public.nomina_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.nomina_id_seq;
       public               postgres    false    238            `           0    0    nomina_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.nomina_id_seq OWNED BY public.nomina.id;
          public               postgres    false    237            �            1259    41141    ofertalaboral    TABLE     H  CREATE TABLE public.ofertalaboral (
    id integer NOT NULL,
    idsucursal integer NOT NULL,
    profesion character varying(20) NOT NULL,
    cargo_vacante character varying(20) NOT NULL,
    descripcion_cargo character varying(200) NOT NULL,
    salario double precision NOT NULL,
    status boolean DEFAULT true NOT NULL
);
 !   DROP TABLE public.ofertalaboral;
       public         heap r       postgres    false            �            1259    41140    ofertalaboral_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ofertalaboral_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.ofertalaboral_id_seq;
       public               postgres    false    231            a           0    0    ofertalaboral_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.ofertalaboral_id_seq OWNED BY public.ofertalaboral.id;
          public               postgres    false    230            �            1259    41154    postulacion    TABLE     x  CREATE TABLE public.postulacion (
    id integer NOT NULL,
    idoferta integer NOT NULL,
    salario double precision NOT NULL,
    tipo_sangre character varying(20) NOT NULL,
    persona_contacto character varying(20) NOT NULL,
    telf character varying(15) NOT NULL,
    nro_cuenta character varying(30) NOT NULL,
    tiempo_contratacion character varying(15) NOT NULL
);
    DROP TABLE public.postulacion;
       public         heap r       postgres    false            �            1259    41153    postulacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.postulacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.postulacion_id_seq;
       public               postgres    false    233            b           0    0    postulacion_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.postulacion_id_seq OWNED BY public.postulacion.id;
          public               postgres    false    232            �            1259    41104 	   profesion    TABLE     �   CREATE TABLE public.profesion (
    id integer NOT NULL,
    nombre character varying(20),
    descripcion character varying(200)
);
    DROP TABLE public.profesion;
       public         heap r       postgres    false            �            1259    41103    profesion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.profesion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.profesion_id_seq;
       public               postgres    false    227            c           0    0    profesion_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.profesion_id_seq OWNED BY public.profesion.id;
          public               postgres    false    226            �            1259    41022    sucursal    TABLE     �   CREATE TABLE public.sucursal (
    id integer NOT NULL,
    nombresucursal character varying(30) NOT NULL,
    descripcionsucursal character varying(200)
);
    DROP TABLE public.sucursal;
       public         heap r       postgres    false            �            1259    41021    sucursal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sucursal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sucursal_id_seq;
       public               postgres    false    218            d           0    0    sucursal_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sucursal_id_seq OWNED BY public.sucursal.id;
          public               postgres    false    217            �            1259    41219    sucursalbanco    TABLE     ~   CREATE TABLE public.sucursalbanco (
    id integer NOT NULL,
    idsucursal integer NOT NULL,
    idbanco integer NOT NULL
);
 !   DROP TABLE public.sucursalbanco;
       public         heap r       postgres    false            �            1259    41218    sucursalbanco_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sucursalbanco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sucursalbanco_id_seq;
       public               postgres    false    242            e           0    0    sucursalbanco_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sucursalbanco_id_seq OWNED BY public.sucursalbanco.id;
          public               postgres    false    241            �            1259    41071    usuariocandidato    TABLE     �  CREATE TABLE public.usuariocandidato (
    cedula integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellido character varying(20) NOT NULL,
    telf character varying(15) NOT NULL,
    edad integer NOT NULL,
    sexo character(1) NOT NULL,
    universidad_egreso character varying(30) NOT NULL,
    idsucursal integer NOT NULL,
    correo character varying(40) NOT NULL,
    contrasenia character varying(20) NOT NULL
);
 $   DROP TABLE public.usuariocandidato;
       public         heap r       postgres    false            �            1259    41059    usuarioempresa    TABLE     �  CREATE TABLE public.usuarioempresa (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    rif character varying(30) NOT NULL,
    telf character varying(15) NOT NULL,
    sector character varying(20) NOT NULL,
    personacontacto character varying(20) NOT NULL,
    idsucursal integer NOT NULL,
    correo character varying(40) NOT NULL,
    contrasenia character varying(20) NOT NULL
);
 "   DROP TABLE public.usuarioempresa;
       public         heap r       postgres    false            �            1259    41058    usuarioempresa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarioempresa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.usuarioempresa_id_seq;
       public               postgres    false    220            f           0    0    usuarioempresa_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.usuarioempresa_id_seq OWNED BY public.usuarioempresa.id;
          public               postgres    false    219            �            1259    41251 	   usuariohg    TABLE       CREATE TABLE public.usuariohg (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    fecha_apertura character varying(15) NOT NULL,
    idsucursal integer NOT NULL,
    correo character varying(40) NOT NULL,
    contrasenia character varying(20) NOT NULL
);
    DROP TABLE public.usuariohg;
       public         heap r       postgres    false            �            1259    41250    usuariohg_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuariohg_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.usuariohg_id_seq;
       public               postgres    false    244            g           0    0    usuariohg_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.usuariohg_id_seq OWNED BY public.usuariohg.id;
          public               postgres    false    243            p           2604    41215    banco id    DEFAULT     d   ALTER TABLE ONLY public.banco ALTER COLUMN id SET DEFAULT nextval('public.banco_id_seq'::regclass);
 7   ALTER TABLE public.banco ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    239    240    240            h           2604    41090    candidatoexperiencia id    DEFAULT     �   ALTER TABLE ONLY public.candidatoexperiencia ALTER COLUMN id SET DEFAULT nextval('public.candidatoexperiencia_id_seq'::regclass);
 F   ALTER TABLE public.candidatoexperiencia ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    225    225            n           2604    41176    candidatopostulacion id    DEFAULT     �   ALTER TABLE ONLY public.candidatopostulacion ALTER COLUMN id SET DEFAULT nextval('public.candidatopostulacion_id_seq'::regclass);
 F   ALTER TABLE public.candidatopostulacion ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    235    234    235            j           2604    41126    candidatoprofesion id    DEFAULT     ~   ALTER TABLE ONLY public.candidatoprofesion ALTER COLUMN id SET DEFAULT nextval('public.candidatoprofesion_id_seq'::regclass);
 D   ALTER TABLE public.candidatoprofesion ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    228    229            g           2604    41083    experiencialaboral id    DEFAULT     ~   ALTER TABLE ONLY public.experiencialaboral ALTER COLUMN id SET DEFAULT nextval('public.experiencialaboral_id_seq'::regclass);
 D   ALTER TABLE public.experiencialaboral ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    222    223            o           2604    41198 	   nomina id    DEFAULT     f   ALTER TABLE ONLY public.nomina ALTER COLUMN id SET DEFAULT nextval('public.nomina_id_seq'::regclass);
 8   ALTER TABLE public.nomina ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    238    238            k           2604    41144    ofertalaboral id    DEFAULT     t   ALTER TABLE ONLY public.ofertalaboral ALTER COLUMN id SET DEFAULT nextval('public.ofertalaboral_id_seq'::regclass);
 ?   ALTER TABLE public.ofertalaboral ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    230    231    231            m           2604    41157    postulacion id    DEFAULT     p   ALTER TABLE ONLY public.postulacion ALTER COLUMN id SET DEFAULT nextval('public.postulacion_id_seq'::regclass);
 =   ALTER TABLE public.postulacion ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    233    233            i           2604    41107    profesion id    DEFAULT     l   ALTER TABLE ONLY public.profesion ALTER COLUMN id SET DEFAULT nextval('public.profesion_id_seq'::regclass);
 ;   ALTER TABLE public.profesion ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    226    227            e           2604    41025    sucursal id    DEFAULT     j   ALTER TABLE ONLY public.sucursal ALTER COLUMN id SET DEFAULT nextval('public.sucursal_id_seq'::regclass);
 :   ALTER TABLE public.sucursal ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            q           2604    41222    sucursalbanco id    DEFAULT     t   ALTER TABLE ONLY public.sucursalbanco ALTER COLUMN id SET DEFAULT nextval('public.sucursalbanco_id_seq'::regclass);
 ?   ALTER TABLE public.sucursalbanco ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    241    242    242            f           2604    41062    usuarioempresa id    DEFAULT     v   ALTER TABLE ONLY public.usuarioempresa ALTER COLUMN id SET DEFAULT nextval('public.usuarioempresa_id_seq'::regclass);
 @   ALTER TABLE public.usuarioempresa ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            r           2604    41254    usuariohg id    DEFAULT     l   ALTER TABLE ONLY public.usuariohg ALTER COLUMN id SET DEFAULT nextval('public.usuariohg_id_seq'::regclass);
 ;   ALTER TABLE public.usuariohg ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    243    244    244            P          0    41212    banco 
   TABLE DATA           8   COPY public.banco (id, nombre, descripcion) FROM stdin;
    public               postgres    false    240   :�       A          0    41087    candidatoexperiencia 
   TABLE DATA           P   COPY public.candidatoexperiencia (id, usercandidato, idexperiencia) FROM stdin;
    public               postgres    false    225   -�       K          0    41173    candidatopostulacion 
   TABLE DATA           V   COPY public.candidatopostulacion (id, cedcandidato, idpostulacion, fecha) FROM stdin;
    public               postgres    false    235   J�       E          0    41123    candidatoprofesion 
   TABLE DATA           L   COPY public.candidatoprofesion (id, usercandidato, idprofesion) FROM stdin;
    public               postgres    false    229   ��       L          0    41189    empleado 
   TABLE DATA           E   COPY public.empleado (cedula, nombre, apellido, salario) FROM stdin;
    public               postgres    false    236   ��       ?          0    41080    experiencialaboral 
   TABLE DATA           b   COPY public.experiencialaboral (id, empresa, fecha_inicio, fecha_finalizacion, cargo) FROM stdin;
    public               postgres    false    223   �       N          0    41195    nomina 
   TABLE DATA           F   COPY public.nomina (id, idempresa, idempleado, mes, anio) FROM stdin;
    public               postgres    false    238   ��       G          0    41141    ofertalaboral 
   TABLE DATA           u   COPY public.ofertalaboral (id, idsucursal, profesion, cargo_vacante, descripcion_cargo, salario, status) FROM stdin;
    public               postgres    false    231   ��       I          0    41154    postulacion 
   TABLE DATA           �   COPY public.postulacion (id, idoferta, salario, tipo_sangre, persona_contacto, telf, nro_cuenta, tiempo_contratacion) FROM stdin;
    public               postgres    false    233   :�       C          0    41104 	   profesion 
   TABLE DATA           <   COPY public.profesion (id, nombre, descripcion) FROM stdin;
    public               postgres    false    227   ��       :          0    41022    sucursal 
   TABLE DATA           K   COPY public.sucursal (id, nombresucursal, descripcionsucursal) FROM stdin;
    public               postgres    false    218   ؙ       R          0    41219    sucursalbanco 
   TABLE DATA           @   COPY public.sucursalbanco (id, idsucursal, idbanco) FROM stdin;
    public               postgres    false    242   _�       =          0    41071    usuariocandidato 
   TABLE DATA           �   COPY public.usuariocandidato (cedula, nombre, apellido, telf, edad, sexo, universidad_egreso, idsucursal, correo, contrasenia) FROM stdin;
    public               postgres    false    221   |�       <          0    41059    usuarioempresa 
   TABLE DATA           y   COPY public.usuarioempresa (id, nombre, rif, telf, sector, personacontacto, idsucursal, correo, contrasenia) FROM stdin;
    public               postgres    false    220   *�       T          0    41251 	   usuariohg 
   TABLE DATA           `   COPY public.usuariohg (id, nombre, fecha_apertura, idsucursal, correo, contrasenia) FROM stdin;
    public               postgres    false    244   ě       h           0    0    banco_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.banco_id_seq', 2, true);
          public               postgres    false    239            i           0    0    candidatoexperiencia_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.candidatoexperiencia_id_seq', 1, false);
          public               postgres    false    224            j           0    0    candidatopostulacion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.candidatopostulacion_id_seq', 2, true);
          public               postgres    false    234            k           0    0    candidatoprofesion_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.candidatoprofesion_id_seq', 1, false);
          public               postgres    false    228            l           0    0    experiencialaboral_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.experiencialaboral_id_seq', 5, true);
          public               postgres    false    222            m           0    0    nomina_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.nomina_id_seq', 1, false);
          public               postgres    false    237            n           0    0    ofertalaboral_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.ofertalaboral_id_seq', 6, true);
          public               postgres    false    230            o           0    0    postulacion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.postulacion_id_seq', 2, true);
          public               postgres    false    232            p           0    0    profesion_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.profesion_id_seq', 2, true);
          public               postgres    false    226            q           0    0    sucursal_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sucursal_id_seq', 3, true);
          public               postgres    false    217            r           0    0    sucursalbanco_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sucursalbanco_id_seq', 1, false);
          public               postgres    false    241            s           0    0    usuarioempresa_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usuarioempresa_id_seq', 3, true);
          public               postgres    false    219            t           0    0    usuariohg_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usuariohg_id_seq', 1, true);
          public               postgres    false    243            �           2606    41217    banco banco_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.banco DROP CONSTRAINT banco_pkey;
       public                 postgres    false    240            �           2606    41092 .   candidatoexperiencia candidatoexperiencia_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.candidatoexperiencia
    ADD CONSTRAINT candidatoexperiencia_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.candidatoexperiencia DROP CONSTRAINT candidatoexperiencia_pkey;
       public                 postgres    false    225            �           2606    41178 .   candidatopostulacion candidatopostulacion_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.candidatopostulacion
    ADD CONSTRAINT candidatopostulacion_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.candidatopostulacion DROP CONSTRAINT candidatopostulacion_pkey;
       public                 postgres    false    235            �           2606    41128 *   candidatoprofesion candidatoprofesion_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.candidatoprofesion
    ADD CONSTRAINT candidatoprofesion_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.candidatoprofesion DROP CONSTRAINT candidatoprofesion_pkey;
       public                 postgres    false    229            �           2606    41193    empleado empleado_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (cedula);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public                 postgres    false    236            �           2606    41085 *   experiencialaboral experiencialaboral_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.experiencialaboral
    ADD CONSTRAINT experiencialaboral_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.experiencialaboral DROP CONSTRAINT experiencialaboral_pkey;
       public                 postgres    false    223            �           2606    41200    nomina nomina_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.nomina
    ADD CONSTRAINT nomina_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.nomina DROP CONSTRAINT nomina_pkey;
       public                 postgres    false    238            �           2606    41147     ofertalaboral ofertalaboral_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ofertalaboral
    ADD CONSTRAINT ofertalaboral_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.ofertalaboral DROP CONSTRAINT ofertalaboral_pkey;
       public                 postgres    false    231            �           2606    41159    postulacion postulacion_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.postulacion
    ADD CONSTRAINT postulacion_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.postulacion DROP CONSTRAINT postulacion_pkey;
       public                 postgres    false    233            �           2606    41109    profesion profesion_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.profesion
    ADD CONSTRAINT profesion_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.profesion DROP CONSTRAINT profesion_pkey;
       public                 postgres    false    227            t           2606    41027    sucursal sucursal_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sucursal DROP CONSTRAINT sucursal_pkey;
       public                 postgres    false    218            �           2606    41224     sucursalbanco sucursalbanco_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sucursalbanco
    ADD CONSTRAINT sucursalbanco_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sucursalbanco DROP CONSTRAINT sucursalbanco_pkey;
       public                 postgres    false    242            ~           2606    41076 &   usuariocandidato unuariocandidato_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.usuariocandidato
    ADD CONSTRAINT unuariocandidato_pkey PRIMARY KEY (cedula);
 P   ALTER TABLE ONLY public.usuariocandidato DROP CONSTRAINT unuariocandidato_pkey;
       public                 postgres    false    221            �           2606    41078 *   usuariocandidato unuariocandidato_telf_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.usuariocandidato
    ADD CONSTRAINT unuariocandidato_telf_key UNIQUE (telf);
 T   ALTER TABLE ONLY public.usuariocandidato DROP CONSTRAINT unuariocandidato_telf_key;
       public                 postgres    false    221            v           2606    41066 (   usuarioempresa usuarioempresa_nombre_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.usuarioempresa
    ADD CONSTRAINT usuarioempresa_nombre_key UNIQUE (nombre);
 R   ALTER TABLE ONLY public.usuarioempresa DROP CONSTRAINT usuarioempresa_nombre_key;
       public                 postgres    false    220            x           2606    41064 "   usuarioempresa usuarioempresa_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.usuarioempresa
    ADD CONSTRAINT usuarioempresa_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.usuarioempresa DROP CONSTRAINT usuarioempresa_pkey;
       public                 postgres    false    220            z           2606    41068 %   usuarioempresa usuarioempresa_rif_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.usuarioempresa
    ADD CONSTRAINT usuarioempresa_rif_key UNIQUE (rif);
 O   ALTER TABLE ONLY public.usuarioempresa DROP CONSTRAINT usuarioempresa_rif_key;
       public                 postgres    false    220            |           2606    41070 &   usuarioempresa usuarioempresa_telf_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.usuarioempresa
    ADD CONSTRAINT usuarioempresa_telf_key UNIQUE (telf);
 P   ALTER TABLE ONLY public.usuarioempresa DROP CONSTRAINT usuarioempresa_telf_key;
       public                 postgres    false    220            �           2606    41256    usuariohg usuariohg_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.usuariohg
    ADD CONSTRAINT usuariohg_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.usuariohg DROP CONSTRAINT usuariohg_pkey;
       public                 postgres    false    244            �           2606    41098 <   candidatoexperiencia candidatoexperiencia_idexperiencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidatoexperiencia
    ADD CONSTRAINT candidatoexperiencia_idexperiencia_fkey FOREIGN KEY (idexperiencia) REFERENCES public.experiencialaboral(id);
 f   ALTER TABLE ONLY public.candidatoexperiencia DROP CONSTRAINT candidatoexperiencia_idexperiencia_fkey;
       public               postgres    false    4738    223    225            �           2606    41093 <   candidatoexperiencia candidatoexperiencia_usercandidato_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidatoexperiencia
    ADD CONSTRAINT candidatoexperiencia_usercandidato_fkey FOREIGN KEY (usercandidato) REFERENCES public.usuariocandidato(cedula);
 f   ALTER TABLE ONLY public.candidatoexperiencia DROP CONSTRAINT candidatoexperiencia_usercandidato_fkey;
       public               postgres    false    221    225    4734            �           2606    41179 :   candidatopostulacion candidatopostulacion_idcandidato_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidatopostulacion
    ADD CONSTRAINT candidatopostulacion_idcandidato_fkey FOREIGN KEY (cedcandidato) REFERENCES public.usuariocandidato(cedula);
 d   ALTER TABLE ONLY public.candidatopostulacion DROP CONSTRAINT candidatopostulacion_idcandidato_fkey;
       public               postgres    false    4734    221    235            �           2606    41184 <   candidatopostulacion candidatopostulacion_idpostulacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidatopostulacion
    ADD CONSTRAINT candidatopostulacion_idpostulacion_fkey FOREIGN KEY (idpostulacion) REFERENCES public.postulacion(id);
 f   ALTER TABLE ONLY public.candidatopostulacion DROP CONSTRAINT candidatopostulacion_idpostulacion_fkey;
       public               postgres    false    4748    233    235            �           2606    41134 6   candidatoprofesion candidatoprofesion_idprofesion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidatoprofesion
    ADD CONSTRAINT candidatoprofesion_idprofesion_fkey FOREIGN KEY (idprofesion) REFERENCES public.profesion(id);
 `   ALTER TABLE ONLY public.candidatoprofesion DROP CONSTRAINT candidatoprofesion_idprofesion_fkey;
       public               postgres    false    229    4742    227            �           2606    41129 8   candidatoprofesion candidatoprofesion_usercandidato_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.candidatoprofesion
    ADD CONSTRAINT candidatoprofesion_usercandidato_fkey FOREIGN KEY (usercandidato) REFERENCES public.usuariocandidato(cedula);
 b   ALTER TABLE ONLY public.candidatoprofesion DROP CONSTRAINT candidatoprofesion_usercandidato_fkey;
       public               postgres    false    229    221    4734            �           2606    41235    usuarioempresa fk_sucursal    FK CONSTRAINT        ALTER TABLE ONLY public.usuarioempresa
    ADD CONSTRAINT fk_sucursal FOREIGN KEY (idsucursal) REFERENCES public.sucursal(id);
 D   ALTER TABLE ONLY public.usuarioempresa DROP CONSTRAINT fk_sucursal;
       public               postgres    false    220    218    4724            �           2606    41240    usuariocandidato fk_sucursal    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuariocandidato
    ADD CONSTRAINT fk_sucursal FOREIGN KEY (idsucursal) REFERENCES public.sucursal(id);
 F   ALTER TABLE ONLY public.usuariocandidato DROP CONSTRAINT fk_sucursal;
       public               postgres    false    221    218    4724            �           2606    41257    usuariohg fk_sucursal    FK CONSTRAINT     z   ALTER TABLE ONLY public.usuariohg
    ADD CONSTRAINT fk_sucursal FOREIGN KEY (idsucursal) REFERENCES public.sucursal(id);
 ?   ALTER TABLE ONLY public.usuariohg DROP CONSTRAINT fk_sucursal;
       public               postgres    false    4724    218    244            �           2606    41206    nomina nomina_idempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.nomina
    ADD CONSTRAINT nomina_idempleado_fkey FOREIGN KEY (idempleado) REFERENCES public.empleado(cedula);
 G   ALTER TABLE ONLY public.nomina DROP CONSTRAINT nomina_idempleado_fkey;
       public               postgres    false    236    238    4752            �           2606    41201    nomina nomina_idempresa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.nomina
    ADD CONSTRAINT nomina_idempresa_fkey FOREIGN KEY (idempresa) REFERENCES public.usuarioempresa(id);
 F   ALTER TABLE ONLY public.nomina DROP CONSTRAINT nomina_idempresa_fkey;
       public               postgres    false    220    238    4728            �           2606    41148 +   ofertalaboral ofertalaboral_idsucursal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ofertalaboral
    ADD CONSTRAINT ofertalaboral_idsucursal_fkey FOREIGN KEY (idsucursal) REFERENCES public.sucursal(id);
 U   ALTER TABLE ONLY public.ofertalaboral DROP CONSTRAINT ofertalaboral_idsucursal_fkey;
       public               postgres    false    218    231    4724            �           2606    41160 %   postulacion postulacion_idoferta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.postulacion
    ADD CONSTRAINT postulacion_idoferta_fkey FOREIGN KEY (idoferta) REFERENCES public.ofertalaboral(id);
 O   ALTER TABLE ONLY public.postulacion DROP CONSTRAINT postulacion_idoferta_fkey;
       public               postgres    false    233    4746    231            �           2606    41230 (   sucursalbanco sucursalbanco_idbanco_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sucursalbanco
    ADD CONSTRAINT sucursalbanco_idbanco_fkey FOREIGN KEY (idbanco) REFERENCES public.banco(id);
 R   ALTER TABLE ONLY public.sucursalbanco DROP CONSTRAINT sucursalbanco_idbanco_fkey;
       public               postgres    false    242    240    4756            �           2606    41225 +   sucursalbanco sucursalbanco_idsucursal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sucursalbanco
    ADD CONSTRAINT sucursalbanco_idsucursal_fkey FOREIGN KEY (idsucursal) REFERENCES public.sucursal(id);
 U   ALTER TABLE ONLY public.sucursalbanco DROP CONSTRAINT sucursalbanco_idsucursal_fkey;
       public               postgres    false    242    4724    218            P   �   x�U��m�0D��)8��]��?���,hR�$�F����2Z��u8ܽ{vR�7�nN�����
��	!�S�	�y6��;���q�$� �R#�X��9N*a�$\C�	*�'uChɿ3�P�+g���;�;����S���Cvۣ�Q�+��5�A��	���`A��CC<g8���7���� m	���Ͷ���LK� �	�Zn��A�q9Y�c/��q��X�      A      x������ � �      K   /   x�3�4435�036�4�44�70�720��r�L�,A���1z\\\ �S�      E      x������ � �      L   U   x�35��435��*M��H-J��415�3�24�X�p�&e&���R������%���D2 1?'�3,1'�(����Tτ+F��� ���      ?   |   x�M�1� ���>ENP�Q��.],B+K�H�����C�����(v���QpL�ώ���A������24�K�bx��x� j�d�j�Ԟ�f94
8�����/?:G����*���W���qC���+      N      x������ � �      G   v   x����1 k{
O% $����JLd	lp�1��CGEw��@�.���j:fpU78�U���Ԅ���y���wP9a��7�E���"M��_�n�z���>�t�+^"���8J      I   q   x�U�!�0�a�ݯ�'[�w�v�@�M��1ï�Y� y�+�@�{�p�e{L%\��\>l��RT1����%��FK!���B
E�&(���=��b�	����k]���Jd�      C      x������ � �      :   w   x���A
�Pе9EN �ޠPt�܌Q$`����_�X(ݹ�0�1M�i�-܆�'����=q1p*R"a��d�&l��-2D��{���19?�.���W}!κ�睮{!��Ϻ_����ށ�`	      R      x������ � �      =   �   x�m̽�0����b������Ű��F~BB�A�0��������9�$M�Q�ex�tO�ۜh����T'H�q�w�wØ݂�w�$)�h�I)SBվ_ɑ�s2*:��QY_��kc�m77g���=!��#�NB��Ē-�����:�      <   �   x�M�A
�0������%�d�)nD\x 7C!�f�h�o[�=~x�S+�O��H`�q�.Ee�ie�WVi��p˪Y,�ݹ�\ۘd����o�\��"z��䢟!|r�ҤT�ǚ*������5c�\G1	      T   =   x�3�L�+��ϫ�44�70�7202�4�L�MM��KtH�M���K���44261������ ��)     