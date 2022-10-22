--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-0ubuntu0.21.04.1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-0ubuntu0.21.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: departamento; Type: TABLE; Schema: public; Owner: drago
--

CREATE TABLE public.departamento (
    nome_departamento character varying(15) NOT NULL,
    numero_departamento integer NOT NULL,
    cpf_gerente character(11) NOT NULL,
    data_inicio_gerente date
);


ALTER TABLE public.departamento OWNER TO drago;

--
-- Name: dependente; Type: TABLE; Schema: public; Owner: drago
--

CREATE TABLE public.dependente (
    cpf_funcionario character(11) NOT NULL,
    nome_dependente character varying(15) NOT NULL,
    sexo character(1),
    data_nascimento date,
    parentesco character varying(8)
);


ALTER TABLE public.dependente OWNER TO drago;

--
-- Name: funcionario; Type: TABLE; Schema: public; Owner: drago
--

CREATE TABLE public.funcionario (
    primeiro_nome character varying(15) NOT NULL,
    nome_meio character(1),
    ultimo_nome character varying(15) NOT NULL,
    cpf character(11) NOT NULL,
    data_nascimento date,
    endereco character varying(30),
    sexo character(1),
    salario numeric(10,2),
    cpf_supervisor character(11),
    numero_departamento integer NOT NULL
);


ALTER TABLE public.funcionario OWNER TO drago;

--
-- Name: localizacoes_departamento; Type: TABLE; Schema: public; Owner: drago
--

CREATE TABLE public.localizacoes_departamento (
    numero_departamento integer NOT NULL,
    local character varying(15) NOT NULL
);


ALTER TABLE public.localizacoes_departamento OWNER TO drago;

--
-- Name: projeto; Type: TABLE; Schema: public; Owner: drago
--

CREATE TABLE public.projeto (
    nome_projeto character varying(15) NOT NULL,
    numero_projeto integer NOT NULL,
    local_projeto character varying(15),
    numero_departamento integer NOT NULL
);


ALTER TABLE public.projeto OWNER TO drago;

--
-- Name: trabalha_em; Type: TABLE; Schema: public; Owner: drago
--

CREATE TABLE public.trabalha_em (
    cpf_funcionario character(11) NOT NULL,
    numero_projeto integer NOT NULL,
    horas numeric(3,1) NOT NULL
);


ALTER TABLE public.trabalha_em OWNER TO drago;

--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: drago
--

COPY public.departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente) FROM stdin;
\.


--
-- Data for Name: dependente; Type: TABLE DATA; Schema: public; Owner: drago
--

COPY public.dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) FROM stdin;
\.


--
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: drago
--

COPY public.funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) FROM stdin;
\.


--
-- Data for Name: localizacoes_departamento; Type: TABLE DATA; Schema: public; Owner: drago
--

COPY public.localizacoes_departamento (numero_departamento, local) FROM stdin;
\.


--
-- Data for Name: projeto; Type: TABLE DATA; Schema: public; Owner: drago
--

COPY public.projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) FROM stdin;
\.


--
-- Data for Name: trabalha_em; Type: TABLE DATA; Schema: public; Owner: drago
--

COPY public.trabalha_em (cpf_funcionario, numero_projeto, horas) FROM stdin;
\.


--
-- Name: departamento departamento_nome_departamento_key; Type: CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_nome_departamento_key UNIQUE (nome_departamento);


--
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (numero_departamento);


--
-- Name: dependente dependente_pkey; Type: CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.dependente
    ADD CONSTRAINT dependente_pkey PRIMARY KEY (cpf_funcionario, nome_dependente);


--
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cpf);


--
-- Name: localizacoes_departamento localizacoes_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.localizacoes_departamento
    ADD CONSTRAINT localizacoes_departamento_pkey PRIMARY KEY (numero_departamento, local);


--
-- Name: projeto projeto_nome_projeto_key; Type: CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.projeto
    ADD CONSTRAINT projeto_nome_projeto_key UNIQUE (nome_projeto);


--
-- Name: projeto projeto_pkey; Type: CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.projeto
    ADD CONSTRAINT projeto_pkey PRIMARY KEY (numero_projeto);


--
-- Name: trabalha_em trabalha_em_pkey; Type: CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.trabalha_em
    ADD CONSTRAINT trabalha_em_pkey PRIMARY KEY (cpf_funcionario, numero_projeto);


--
-- Name: departamento departamento_cpf_gerente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_cpf_gerente_fkey FOREIGN KEY (cpf_gerente) REFERENCES public.funcionario(cpf);


--
-- Name: dependente dependente_cpf_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.dependente
    ADD CONSTRAINT dependente_cpf_funcionario_fkey FOREIGN KEY (cpf_funcionario) REFERENCES public.funcionario(cpf);


--
-- Name: localizacoes_departamento localizacoes_departamento_numero_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.localizacoes_departamento
    ADD CONSTRAINT localizacoes_departamento_numero_departamento_fkey FOREIGN KEY (numero_departamento) REFERENCES public.departamento(numero_departamento);


--
-- Name: projeto projeto_numero_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.projeto
    ADD CONSTRAINT projeto_numero_departamento_fkey FOREIGN KEY (numero_departamento) REFERENCES public.departamento(numero_departamento);


--
-- Name: trabalha_em trabalha_em_cpf_funcionario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.trabalha_em
    ADD CONSTRAINT trabalha_em_cpf_funcionario_fkey FOREIGN KEY (cpf_funcionario) REFERENCES public.funcionario(cpf);


--
-- Name: trabalha_em trabalha_em_numero_projeto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: drago
--

ALTER TABLE ONLY public.trabalha_em
    ADD CONSTRAINT trabalha_em_numero_projeto_fkey FOREIGN KEY (numero_projeto) REFERENCES public.projeto(numero_projeto);


--
-- PostgreSQL database dump complete
--

