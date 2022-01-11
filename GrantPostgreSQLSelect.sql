-- Entrando no psql com o usuário postgres
psql

-- Listando os usuários existentes
\du

-- Criando o usuário que será destinado a leitura/select
CREATE USER usr_lgpd WITH ENCRYPTED PASSWORD '#YourStrong!Passw0rd#';

-- Conectando na database no qual desejamos permitir leitura/select
\c dw

-- Listamos todos os Schemas da database que estamos conectado
\dn

-- Aplicando permissão/Grant de select e de uso para cada schema do banco em que desejamos permitir a leitura/select
GRANT USAGE ON SCHEMA public TO usr_lgpd;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO usr_lgpd;

GRANT USAGE ON SCHEMA dm_onihosp TO usr_lgpd;
GRANT SELECT ON ALL TABLES IN SCHEMA dm_onihosp TO usr_lgpd;

GRANT USAGE ON SCHEMA dm_agenda_onigestor TO usr_lgpd;
GRANT SELECT ON ALL TABLES IN SCHEMA dm_agenda_onigestor TO usr_lgpd;







-- ############################################################################### --
-- ############################################################################### --
-- ############################################################################### --
-- ################### Abaixo comandos para eliminar o usuário ################### --

-- Dropando o usuário
REVOKE USAGE ON SCHEMA public FROM usr_lgpd;
REVOKE USAGE ON SCHEMA dm_onihosp FROM usr_lgpd;
REVOKE USAGE ON SCHEMA dm_agenda_onigestor FROM usr_lgpd;
REVOKE SELECT ON ALL TABLES IN SCHEMA public FROM usr_lgpd;
REVOKE SELECT ON ALL TABLES IN SCHEMA dm_onihosp FROM usr_lgpd;
REVOKE SELECT ON ALL TABLES IN SCHEMA dm_agenda_onigestor FROM usr_lgpd;
DROP USER usr_lgpd;



