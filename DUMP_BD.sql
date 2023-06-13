PGDMP                         {         	   tarea2eje    15.2    15.2 A    R           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            S           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            T           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            U           1262    16722 	   tarea2eje    DATABASE     |   CREATE DATABASE tarea2eje WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE tarea2eje;
                postgres    false                        2615    16973    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            V           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5            W           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    5            �            1259    17391    Defensas    TABLE     k   CREATE TABLE public."Defensas" (
    id integer NOT NULL,
    "Defenzas" character varying(45) NOT NULL
);
    DROP TABLE public."Defensas";
       public         heap    postgres    false    5            �            1259    17404    DefensasReinos    TABLE     j   CREATE TABLE public."DefensasReinos" (
    id_defensas integer NOT NULL,
    id_reino integer NOT NULL
);
 $   DROP TABLE public."DefensasReinos";
       public         heap    postgres    false    5            �            1259    17390    Defensas_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Defensas_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Defensas_id_seq";
       public          postgres    false    5    223            X           0    0    Defensas_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Defensas_id_seq" OWNED BY public."Defensas".id;
          public          postgres    false    222            �            1259    17409    Diplomacias    TABLE     �   CREATE TABLE public."Diplomacias" (
    id_reino1 integer NOT NULL,
    id_reino2 integer NOT NULL,
    es_aliado boolean DEFAULT false NOT NULL
);
 !   DROP TABLE public."Diplomacias";
       public         heap    postgres    false    5            �            1259    17372    Karts    TABLE     �   CREATE TABLE public."Karts" (
    id integer NOT NULL,
    modelo character varying(45) NOT NULL,
    color character varying(45) NOT NULL,
    velocidad_max integer,
    id_personaje integer
);
    DROP TABLE public."Karts";
       public         heap    postgres    false    5            �            1259    17371    Karts_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Karts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Karts_id_seq";
       public          postgres    false    218    5            Y           0    0    Karts_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Karts_id_seq" OWNED BY public."Karts".id;
          public          postgres    false    217            �            1259    17415    Personaje_habita_reino    TABLE     �   CREATE TABLE public."Personaje_habita_reino" (
    id_personaje integer NOT NULL,
    id_reino integer NOT NULL,
    fecha_registro timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    es_gobernante boolean DEFAULT false NOT NULL
);
 ,   DROP TABLE public."Personaje_habita_reino";
       public         heap    postgres    false    5            �            1259    17385    Personaje_tiene_trabajo    TABLE     �   CREATE TABLE public."Personaje_tiene_trabajo" (
    id_trabajo integer NOT NULL,
    id_personaje integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_termino date
);
 -   DROP TABLE public."Personaje_tiene_trabajo";
       public         heap    postgres    false    5            �            1259    17219 
   Personajes    TABLE     �   CREATE TABLE public."Personajes" (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    fuerza integer NOT NULL,
    fecha_nacimiento date NOT NULL,
    objeto character varying(30)
);
     DROP TABLE public."Personajes";
       public         heap    postgres    false    5            �            1259    17218    Personajes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Personajes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Personajes_id_seq";
       public          postgres    false    5    216            Z           0    0    Personajes_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Personajes_id_seq" OWNED BY public."Personajes".id;
          public          postgres    false    215            �            1259    17398    Reinos    TABLE     �   CREATE TABLE public."Reinos" (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    ubicacion character varying(45) NOT NULL,
    superficie integer NOT NULL
);
    DROP TABLE public."Reinos";
       public         heap    postgres    false    5            �            1259    17397    Reinos_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reinos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Reinos_id_seq";
       public          postgres    false    5    225            [           0    0    Reinos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Reinos_id_seq" OWNED BY public."Reinos".id;
          public          postgres    false    224            �            1259    17379    Trabajos    TABLE     �   CREATE TABLE public."Trabajos" (
    id integer NOT NULL,
    descripcion character varying(45),
    sueldo integer NOT NULL
);
    DROP TABLE public."Trabajos";
       public         heap    postgres    false    5            �            1259    17378    Trabajos_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Trabajos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Trabajos_id_seq";
       public          postgres    false    5    220            \           0    0    Trabajos_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Trabajos_id_seq" OWNED BY public."Trabajos".id;
          public          postgres    false    219            �            1259    16974    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false    5            �           2604    17394    Defensas id    DEFAULT     n   ALTER TABLE ONLY public."Defensas" ALTER COLUMN id SET DEFAULT nextval('public."Defensas_id_seq"'::regclass);
 <   ALTER TABLE public."Defensas" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    17375    Karts id    DEFAULT     h   ALTER TABLE ONLY public."Karts" ALTER COLUMN id SET DEFAULT nextval('public."Karts_id_seq"'::regclass);
 9   ALTER TABLE public."Karts" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    17222    Personajes id    DEFAULT     r   ALTER TABLE ONLY public."Personajes" ALTER COLUMN id SET DEFAULT nextval('public."Personajes_id_seq"'::regclass);
 >   ALTER TABLE public."Personajes" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    17401 	   Reinos id    DEFAULT     j   ALTER TABLE ONLY public."Reinos" ALTER COLUMN id SET DEFAULT nextval('public."Reinos_id_seq"'::regclass);
 :   ALTER TABLE public."Reinos" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    17382    Trabajos id    DEFAULT     n   ALTER TABLE ONLY public."Trabajos" ALTER COLUMN id SET DEFAULT nextval('public."Trabajos_id_seq"'::regclass);
 <   ALTER TABLE public."Trabajos" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            J          0    17391    Defensas 
   TABLE DATA           4   COPY public."Defensas" (id, "Defenzas") FROM stdin;
    public          postgres    false    223   O       M          0    17404    DefensasReinos 
   TABLE DATA           A   COPY public."DefensasReinos" (id_defensas, id_reino) FROM stdin;
    public          postgres    false    226   /O       N          0    17409    Diplomacias 
   TABLE DATA           H   COPY public."Diplomacias" (id_reino1, id_reino2, es_aliado) FROM stdin;
    public          postgres    false    227   LO       E          0    17372    Karts 
   TABLE DATA           Q   COPY public."Karts" (id, modelo, color, velocidad_max, id_personaje) FROM stdin;
    public          postgres    false    218   iO       O          0    17415    Personaje_habita_reino 
   TABLE DATA           i   COPY public."Personaje_habita_reino" (id_personaje, id_reino, fecha_registro, es_gobernante) FROM stdin;
    public          postgres    false    228   �O       H          0    17385    Personaje_tiene_trabajo 
   TABLE DATA           j   COPY public."Personaje_tiene_trabajo" (id_trabajo, id_personaje, fecha_inicio, fecha_termino) FROM stdin;
    public          postgres    false    221   �O       C          0    17219 
   Personajes 
   TABLE DATA           T   COPY public."Personajes" (id, nombre, fuerza, fecha_nacimiento, objeto) FROM stdin;
    public          postgres    false    216   P       L          0    17398    Reinos 
   TABLE DATA           E   COPY public."Reinos" (id, nombre, ubicacion, superficie) FROM stdin;
    public          postgres    false    225   mP       G          0    17379    Trabajos 
   TABLE DATA           =   COPY public."Trabajos" (id, descripcion, sueldo) FROM stdin;
    public          postgres    false    220   �P       A          0    16974    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   �P       ]           0    0    Defensas_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Defensas_id_seq"', 1, false);
          public          postgres    false    222            ^           0    0    Karts_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Karts_id_seq"', 8, true);
          public          postgres    false    217            _           0    0    Personajes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Personajes_id_seq"', 4, true);
          public          postgres    false    215            `           0    0    Reinos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Reinos_id_seq"', 2, true);
          public          postgres    false    224            a           0    0    Trabajos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Trabajos_id_seq"', 3, true);
          public          postgres    false    219            �           2606    17408 "   DefensasReinos DefensasReinos_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."DefensasReinos"
    ADD CONSTRAINT "DefensasReinos_pkey" PRIMARY KEY (id_defensas, id_reino);
 P   ALTER TABLE ONLY public."DefensasReinos" DROP CONSTRAINT "DefensasReinos_pkey";
       public            postgres    false    226    226            �           2606    17396    Defensas Defensas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Defensas"
    ADD CONSTRAINT "Defensas_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Defensas" DROP CONSTRAINT "Defensas_pkey";
       public            postgres    false    223            �           2606    17414    Diplomacias Diplomacias_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Diplomacias"
    ADD CONSTRAINT "Diplomacias_pkey" PRIMARY KEY (id_reino1, id_reino2);
 J   ALTER TABLE ONLY public."Diplomacias" DROP CONSTRAINT "Diplomacias_pkey";
       public            postgres    false    227    227            �           2606    17377    Karts Karts_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Karts"
    ADD CONSTRAINT "Karts_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Karts" DROP CONSTRAINT "Karts_pkey";
       public            postgres    false    218            �           2606    17420 2   Personaje_habita_reino Personaje_habita_reino_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_habita_reino"
    ADD CONSTRAINT "Personaje_habita_reino_pkey" PRIMARY KEY (id_personaje, id_reino);
 `   ALTER TABLE ONLY public."Personaje_habita_reino" DROP CONSTRAINT "Personaje_habita_reino_pkey";
       public            postgres    false    228    228            �           2606    17389 4   Personaje_tiene_trabajo Personaje_tiene_trabajo_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_tiene_trabajo"
    ADD CONSTRAINT "Personaje_tiene_trabajo_pkey" PRIMARY KEY (id_trabajo, id_personaje);
 b   ALTER TABLE ONLY public."Personaje_tiene_trabajo" DROP CONSTRAINT "Personaje_tiene_trabajo_pkey";
       public            postgres    false    221    221            �           2606    17226    Personajes Personajes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Personajes"
    ADD CONSTRAINT "Personajes_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Personajes" DROP CONSTRAINT "Personajes_pkey";
       public            postgres    false    216            �           2606    17403    Reinos Reinos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Reinos"
    ADD CONSTRAINT "Reinos_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Reinos" DROP CONSTRAINT "Reinos_pkey";
       public            postgres    false    225            �           2606    17384    Trabajos Trabajos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Trabajos"
    ADD CONSTRAINT "Trabajos_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Trabajos" DROP CONSTRAINT "Trabajos_pkey";
       public            postgres    false    220            �           2606    16982 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    214            �           2606    17436 .   DefensasReinos DefensasReinos_id_defensas_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DefensasReinos"
    ADD CONSTRAINT "DefensasReinos_id_defensas_fkey" FOREIGN KEY (id_defensas) REFERENCES public."Defensas"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public."DefensasReinos" DROP CONSTRAINT "DefensasReinos_id_defensas_fkey";
       public          postgres    false    226    3234    223            �           2606    17441 +   DefensasReinos DefensasReinos_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DefensasReinos"
    ADD CONSTRAINT "DefensasReinos_id_reino_fkey" FOREIGN KEY (id_reino) REFERENCES public."Reinos"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Y   ALTER TABLE ONLY public."DefensasReinos" DROP CONSTRAINT "DefensasReinos_id_reino_fkey";
       public          postgres    false    226    3236    225            �           2606    17446 &   Diplomacias Diplomacias_id_reino1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Diplomacias"
    ADD CONSTRAINT "Diplomacias_id_reino1_fkey" FOREIGN KEY (id_reino1) REFERENCES public."Reinos"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public."Diplomacias" DROP CONSTRAINT "Diplomacias_id_reino1_fkey";
       public          postgres    false    3236    225    227            �           2606    20155    Karts Karts_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Karts"
    ADD CONSTRAINT "Karts_id_personaje_fkey" FOREIGN KEY (id_personaje) REFERENCES public."Personajes"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Karts" DROP CONSTRAINT "Karts_id_personaje_fkey";
       public          postgres    false    218    216    3226            �           2606    17451 ?   Personaje_habita_reino Personaje_habita_reino_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_habita_reino"
    ADD CONSTRAINT "Personaje_habita_reino_id_personaje_fkey" FOREIGN KEY (id_personaje) REFERENCES public."Personajes"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 m   ALTER TABLE ONLY public."Personaje_habita_reino" DROP CONSTRAINT "Personaje_habita_reino_id_personaje_fkey";
       public          postgres    false    228    216    3226            �           2606    17456 ;   Personaje_habita_reino Personaje_habita_reino_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_habita_reino"
    ADD CONSTRAINT "Personaje_habita_reino_id_reino_fkey" FOREIGN KEY (id_reino) REFERENCES public."Reinos"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 i   ALTER TABLE ONLY public."Personaje_habita_reino" DROP CONSTRAINT "Personaje_habita_reino_id_reino_fkey";
       public          postgres    false    225    228    3236            �           2606    17431 A   Personaje_tiene_trabajo Personaje_tiene_trabajo_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_tiene_trabajo"
    ADD CONSTRAINT "Personaje_tiene_trabajo_id_personaje_fkey" FOREIGN KEY (id_personaje) REFERENCES public."Personajes"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 o   ALTER TABLE ONLY public."Personaje_tiene_trabajo" DROP CONSTRAINT "Personaje_tiene_trabajo_id_personaje_fkey";
       public          postgres    false    3226    221    216            �           2606    17426 ?   Personaje_tiene_trabajo Personaje_tiene_trabajo_id_trabajo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_tiene_trabajo"
    ADD CONSTRAINT "Personaje_tiene_trabajo_id_trabajo_fkey" FOREIGN KEY (id_trabajo) REFERENCES public."Trabajos"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 m   ALTER TABLE ONLY public."Personaje_tiene_trabajo" DROP CONSTRAINT "Personaje_tiene_trabajo_id_trabajo_fkey";
       public          postgres    false    3230    220    221            J      x������ � �      M      x������ � �      N      x������ � �      E   D   x�3�LL/M�,K-JI�46���2�2�!s�2@�sYp�f����s�g�sZ��b���� �x      O   "   x�3�4�4�47�50"+0�L����� U7      H      x�3�4�4204�50�50������� -��      C   ?   x�3��K�Lͩ�42�4200�5��50�L-.HLI�2��)�L��45 I��9c��b���� ɏ�      L   8   x�3��K,��L�L,-�/H�42600�2�,J���7�L�M-�LN�44	��qqq w_      G   /   x�3�L�(��/JL�/�42600�2��M,��K-��42	��qqq �m
�      A   h  x�u�[n$7E�۫���K�؋�
hP����83�+6����BI��ѽb�:Ů^*iV�c��v��\U;� ]'�[C�J����T]�F����q��z�
#�'��0>b�`���@H
���;b�L|�����Oߞ��������Ƈ����PfoVD:��A���c��8��Х׺���T݅��)<9Z���z�����0rҝ
��*��dh��)�Qmgw=>y�m�q�>v�^,�Psq0!N�<�U��9��3���!����`9��'�
k�	i�7Z�/"�37Ԫ?C��{"���չ�5y�!�@h�T��3�@���A�rʴ1Aff�lʐ�}��8�f�XO��Ҍ�T�M4V7�W�J>�cP��ẟ���� �Dz����ዴ�8$A�f�����ֻ)�zZ��y��M��N�t��e�+%��0U���L�w�UAp��lo� 0���/?V�_���̩��U�ZC"�_,�(�3Gy>�)c�@+�)�e�)�($��Y5��Ȫ���m3�L�����tb����N�ay�~��m���П��o��+���*E�>!R��\~�!%x����qQ�A�7���4�ѼgQ&-�$C�@fJ3Ykɇ�*�� �Z�T��-V�Z������?������T�oIZݳ#�*C$`Yi=�K�jK;ev@VT��4�4�8���ږ��C�i�l��	ftkmCm(�^_��Jt��d����|{����Q^����̊�lv]�o!��R8�����}�c�]��`��X�ˑmJy.W�<Aۋ��G# ��*�#���@3l�(Ȑ����vz�oB�l=�8_��W�     