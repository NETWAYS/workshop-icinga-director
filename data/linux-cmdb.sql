DROP TABLE IF EXISTS hosts;

CREATE TABLE hosts (
  id INT AUTO_INCREMENT,
  name VARCHAR(255),
  address VARCHAR(255),
  operatingsystem VARCHAR(255),
  osfamily VARCHAR(255),
  kernel VARCHAR(255),
  PRIMARY KEY (id),
  UNIQUE KEY name_idx (name)
);

INSERT INTO hosts
  (name, address, operatingsystem, osfamily, kernel)
  VALUES
  ('gigantic-shockley', '127.1.2.1', 'RedHat Enterprise Linux 7', 'redhat', 'linux'),
  ('fervent-knuth', '127.1.2.2', 'Oracle Enterprise Linux 6', 'redhat', 'linux'),
  ('sharp-chandrasekhar', '127.1.2.3', 'CentOS 7', 'redhat', 'linux'),
  ('gloomy-ride', '127.1.2.4', 'Debian 9', 'ubuntu', 'linux'),
  ('prickly-pare', '127.1.2.5', 'Ubuntu 18.04 Bionic', 'ubuntu', 'linux'),
  ('high-heyrovsky', '127.1.2.6', 'SUSE Linux Enterprise Server 12.4', 'suse', 'linux'),
  ('compassionate-roentgen', '127.1.2.7', 'ArchLinux Experimental Edition', 'archlinux', 'linux')
;
