CREATE TABLE petPet (
  petname varchar(20) NOT NULL PRIMARY KEY,
  owner varchar(45),
  species varchar(45),
  gender char(1),
  CHECK (gender = 'M' OR gender = 'F'),
  birth date,
  death date
);

CREATE TABLE petEvent (
  eventID int NOT NULL AUTO_INCREMENT,
  petname varchar(20), 
  eventdate date,
  eventtype varchar(45),
  remark varchar(255),
  FOREIGN KEY (petname) REFERENCES petPet(petname),
  PRIMARY KEY (eventID)
);