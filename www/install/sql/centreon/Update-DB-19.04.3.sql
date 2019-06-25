-- Add HTTPS connexion to Remote Server
ALTER TABLE remote_servers ADD COLUMN IF NOT EXISTS `http_method` enum('http','https') NOT NULL DEFAULT 'http';
ALTER TABLE remote_servers ADD COLUMN IF NOT EXISTS `http_port` int(11) NULL DEFAULT NULL;
ALTER TABLE remote_servers ADD COLUMN IF NOT EXISTS `no_check_certificate` enum('0','1') NOT NULL DEFAULT '0';
ALTER TABLE remote_servers ADD COLUMN IF NOT EXISTS `no_proxy` enum('0','1') NOT NULL DEFAULT '0';

-- Update topology of service grid
UPDATE topology SET topology_url_opt = '&o=svcOV_pb' WHERE topology_page = 20204;
-- Update topology of service by host group
UPDATE topology SET topology_url_opt = '&o=svcOVHG_pb' WHERE topology_page = 20209;
-- Update topology of service by service group
UPDATE topology SET topology_url_opt = '&o=svcOVSG_pb' WHERE topology_page = 20212;