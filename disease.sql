PGDMP     1    9            
    y            diseases    14.0    14.0 *    -           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            .           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            /           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            0           1262    24596    diseases    DATABASE     e   CREATE DATABASE diseases WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE diseases;
                postgres    false            �            1259    24680    User    TABLE     �   CREATE TABLE public."User" (
    email character varying(60) NOT NULL,
    name character varying(40),
    surname character varying(40),
    salary integer,
    phone character varying(20),
    cname character varying(50)
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    24602    country    TABLE     a   CREATE TABLE public.country (
    cname character varying(50) NOT NULL,
    population bigint
);
    DROP TABLE public.country;
       public         heap    postgres    false            �            1259    24885    discover    TABLE     �   CREATE TABLE public.discover (
    cname character varying(50) NOT NULL,
    "disease code" character varying(50) NOT NULL,
    "first enc date" date
);
    DROP TABLE public.discover;
       public         heap    postgres    false            �            1259    24655    disease    TABLE     �   CREATE TABLE public.disease (
    "disease code" character varying(50) NOT NULL,
    pathogen character varying(20),
    description character varying(140),
    id integer
);
    DROP TABLE public.disease;
       public         heap    postgres    false            �            1259    24597    diseasetype    TABLE     e   CREATE TABLE public.diseasetype (
    id integer NOT NULL,
    description character varying(140)
);
    DROP TABLE public.diseasetype;
       public         heap    postgres    false            �            1259    24700    doctor    TABLE     k   CREATE TABLE public.doctor (
    email character varying(60) NOT NULL,
    degree character varying(20)
);
    DROP TABLE public.doctor;
       public         heap    postgres    false            �            1259    24690    publicservant    TABLE     v   CREATE TABLE public.publicservant (
    email character varying(60) NOT NULL,
    department character varying(50)
);
 !   DROP TABLE public.publicservant;
       public         heap    postgres    false            �            1259    24725    record    TABLE     �   CREATE TABLE public.record (
    email character varying(60),
    cname character varying(50),
    "disease code" character varying(50),
    "total deaths" integer,
    "total patients" integer
);
    DROP TABLE public.record;
       public         heap    postgres    false            �            1259    24710 
   specialize    TABLE     f   CREATE TABLE public.specialize (
    id integer NOT NULL,
    email character varying(60) NOT NULL
);
    DROP TABLE public.specialize;
       public         heap    postgres    false            %          0    24680    User 
   TABLE DATA           L   COPY public."User" (email, name, surname, salary, phone, cname) FROM stdin;
    public          postgres    false    212   g1       #          0    24602    country 
   TABLE DATA           4   COPY public.country (cname, population) FROM stdin;
    public          postgres    false    210   �2       *          0    24885    discover 
   TABLE DATA           K   COPY public.discover (cname, "disease code", "first enc date") FROM stdin;
    public          postgres    false    217   �3       $          0    24655    disease 
   TABLE DATA           L   COPY public.disease ("disease code", pathogen, description, id) FROM stdin;
    public          postgres    false    211   �4       "          0    24597    diseasetype 
   TABLE DATA           6   COPY public.diseasetype (id, description) FROM stdin;
    public          postgres    false    209   }5       '          0    24700    doctor 
   TABLE DATA           /   COPY public.doctor (email, degree) FROM stdin;
    public          postgres    false    214   �5       &          0    24690    publicservant 
   TABLE DATA           :   COPY public.publicservant (email, department) FROM stdin;
    public          postgres    false    213   �6       )          0    24725    record 
   TABLE DATA           `   COPY public.record (email, cname, "disease code", "total deaths", "total patients") FROM stdin;
    public          postgres    false    216   Q7       (          0    24710 
   specialize 
   TABLE DATA           /   COPY public.specialize (id, email) FROM stdin;
    public          postgres    false    215   J9       �           2606    24684    User User_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (email);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    212            ~           2606    24606    country country_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (cname);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public            postgres    false    210            �           2606    24889    discover discover_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_pkey PRIMARY KEY (cname, "disease code");
 @   ALTER TABLE ONLY public.discover DROP CONSTRAINT discover_pkey;
       public            postgres    false    217    217            �           2606    24659    disease disease_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY ("disease code");
 >   ALTER TABLE ONLY public.disease DROP CONSTRAINT disease_pkey;
       public            postgres    false    211            |           2606    24601    diseasetype diseasetype_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.diseasetype
    ADD CONSTRAINT diseasetype_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.diseasetype DROP CONSTRAINT diseasetype_pkey;
       public            postgres    false    209            �           2606    24704    doctor doctor_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (email);
 <   ALTER TABLE ONLY public.doctor DROP CONSTRAINT doctor_pkey;
       public            postgres    false    214            �           2606    24694     publicservant publicservant_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_pkey PRIMARY KEY (email);
 J   ALTER TABLE ONLY public.publicservant DROP CONSTRAINT publicservant_pkey;
       public            postgres    false    213            �           2606    24714    specialize specialize_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_pkey PRIMARY KEY (id, email);
 D   ALTER TABLE ONLY public.specialize DROP CONSTRAINT specialize_pkey;
       public            postgres    false    215    215            �           1259    25044    idx_pathogen    INDEX     D   CREATE INDEX idx_pathogen ON public.disease USING btree (pathogen);
     DROP INDEX public.idx_pathogen;
       public            postgres    false    211            �           2606    24890    discover discover_cname_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.discover DROP CONSTRAINT discover_cname_fkey;
       public          postgres    false    210    3198    217            �           2606    24895    discover discover_dc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_dc_fkey FOREIGN KEY ("disease code") REFERENCES public.disease("disease code") ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.discover DROP CONSTRAINT discover_dc_fkey;
       public          postgres    false    217    211    3200            �           2606    24660    disease disease_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.disease DROP CONSTRAINT disease_id_fkey;
       public          postgres    false    209    211    3196            �           2606    24695     publicservant publics_email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publics_email_fkey FOREIGN KEY (email) REFERENCES public."User"(email) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.publicservant DROP CONSTRAINT publics_email_fkey;
       public          postgres    false    212    213    3203            �           2606    24705    doctor publics_email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT publics_email_fkey FOREIGN KEY (email) REFERENCES public."User"(email) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.doctor DROP CONSTRAINT publics_email_fkey;
       public          postgres    false    3203    214    212            �           2606    24733    record record_cname_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.record DROP CONSTRAINT record_cname_fkey;
       public          postgres    false    216    210    3198            �           2606    24728    record record_dc_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_dc_fkey FOREIGN KEY ("disease code") REFERENCES public.disease("disease code") ON UPDATE CASCADE ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.record DROP CONSTRAINT record_dc_fkey;
       public          postgres    false    3200    211    216            �           2606    24738    record record_email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_email_fkey FOREIGN KEY (email) REFERENCES public.publicservant(email) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.record DROP CONSTRAINT record_email_fkey;
       public          postgres    false    3205    213    216            �           2606    24720    specialize spec_email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT spec_email_fkey FOREIGN KEY (email) REFERENCES public.doctor(email) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.specialize DROP CONSTRAINT spec_email_fkey;
       public          postgres    false    215    214    3207            �           2606    24715    specialize spec_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT spec_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.specialize DROP CONSTRAINT spec_id_fkey;
       public          postgres    false    209    215    3196            �           2606    24685    User user_cname_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT user_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public."User" DROP CONSTRAINT user_cname_fkey;
       public          postgres    false    210    212    3198            %   v  x�MR�n�0|^~E~����-n��.�9P@�l�چ"�r�|}V�S�|��gg9�HN��z��H�|kx^P���>{4� u��$ɫ�ik��ɠ���F��|�O�u���*�$)ʪ�[xzX:�Q�:�c$�0?py-�ʪHX����t��HE����}@��:i~+���d��f�5j�����p6R?��R��x�<84mU�E�$p�|��F�Ŗi�z����.�4�#���E	w=iz'�F�Ϛ�j�$�n"��L�������K�r�����
o;�\�x������f�Ң*�,�_���j!����H{b�*0P-��y�yV�ƣ�:<��Ɂ����
�G���mv�8�	�F��!� c4Ţ      #   �   x�=�KK1�׹?F�#ϥ
j)�Xܹ�8�CI���כ��,����V]6�Q��RՐ���x��G�f�%ǉ<5�_��`I>�F�Ct�!���Q�fR���:��'i�1H�׼ι-Z�n(8O6��e)�S�y@L(N����>ku��]��y�uD,&��z�﹯:X��C�KY������C�&���?��@�      *   �   x�-��j�0��һ(Hv�wL
�.�RXz��l�Ɛ�K�mٷ��ti�oq��`t@�`H�>̹D8~�$�b	$Ll�)��T����&V��X�	F��4���v�wt��I3��%�w���ޓ���2��1-%�;RnO{ޑ�[K���nsZ�X�v��X/���9/�z�%��_Yg�)�Ϲls�*H�Z�������T`ߩ���H5�C�_leE�      $   �   x�}�I�0E��)�@��K��!�IC��(����$�RQ7����o�L$-�]��z�dD�Z�L��q#V^,�v�5=�!D��D@)���3H����C��um`Gb���Q��&�.�K{�GsJ���d�9�=� ���پ��z[a��tLɡd�����d@1���������1�79(�S��Q � 6~D      "   n   x�m�K
�@D��)<���]�����x�YIo�+^=
��)^�x���Y�mզ&lbع���_�[\qt�_Nl�u}!~��$�fNO1gǤ�%*_�-y��z-P�      '   �   x�m�1�0E��.�=H%��r��1Tܾ�1d���'h�䛬x-�C��,�9���^L!4��ȍAk��bd�F�K�����m�o���̧�S(�2!P��:��(H/�@��]�DE���]�cuy���#{t/��g.j7�"L�2-�����=���K�      &   �   x�]Ͻ�0������d9m�91rܢ�=eL�[���*lh���4���3~�DK*�د���#���^j9���C�8�tm���Z�5_�ec!��/�AW ��s���1J��[�/��h^�\����V�]�s�a���� ~�iH      )   �  x��Oo�0���wi�?�,ߖ�V��0Ǎ�)v!9�O?�V�m�ݷ�N|z|�O:R�{�ћ�|X4�N��|O�~s�*QYc��ҁ�ű��!��o���LuC���K#�ORUZ��� �,��M�m�c�T���g^`QJa '�(MM|%�9d�U�{2m@ Z���G��꘧�)3'�R8��.(����z目m�y�i��l%N�����C��J��º�c&��O)�TJS9���L�����r&���k�þ�R<�e�p�&?)n�8��>W|��|��Bm�Th��0�pPP9+T��T38�XQi��
@8_�fθJ��S烿��}���b�b�u���ԥ,(X���s�؎]��$V�lg�cZ����]��iO-"�$���\�蹩=���'o�_���)NC3��0K�٬�e��c@M�.�sʽ��%s��ۨ`��>u�蔼���0��������O;Dӏ��/}[E��� 6      (   �   x�}���@E��_$�t燘4F��L�2j�{a�l��'�=m3Mlh�1Db);�E��W0�*��Zfd�N��0��8O.>Ï�GӶ���d!�)SZ��cW��Xe��7h����z�܍A|�ޚ���A�6Xv�Y[΋%�4gN�q���jG��w^���-�eQ� ��     