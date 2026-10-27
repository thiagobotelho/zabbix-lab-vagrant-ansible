-- Schema mínimo sintético para verificar as guardas de importação, sem dados reais.
CREATE TABLE public.dbversion (mandatory INTEGER PRIMARY KEY);
INSERT INTO public.dbversion VALUES (1);
CREATE TABLE public.history (clock INTEGER NOT NULL, value DOUBLE PRECISION);
CREATE TABLE public.payload (id INTEGER PRIMARY KEY);
