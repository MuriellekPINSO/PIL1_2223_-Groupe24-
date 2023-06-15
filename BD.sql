CREATE DATABASE Donnees;

USE Donnees;
CREATE TABLE Filiere(id_Filiere VARCHAR(255) PRIMARY KEY,nom_Filiere VARCHAR(255));

CREATE TABLE Cours(id_Cours VARCHAR(255) PRIMARY KEY ,nom_Cours VARCHAR(255),id_Filiere VARCHAR(255));


CREATE TABLE Enseignants(id_Enseignants VARCHAR(255) PRIMARY KEY ,nom_Enseignants VARCHAR(255),mail_Enseignants VARCHAR(255),tel_Enseignants VARCHAR(255));


CREATE TABLE Etudiants(id_Etudiants VARCHAR(255) PRIMARY KEY, nom_Etudiants VARCHAR(255),mail_Etudiants VARCHAR(255),tel_Etudiants VARCHAR (255),id_Filiere VARCHAR(255));


CREATE TABLE Emplois(id INT AUTO_INCREMENT PRIMARY KEY,id_Filiere VARCHAR(255),id_Cours VARCHAR(255),id_Enseignants VARCHAR(255),jour VARCHAR (255),heure_deb VARCHAR(255),heure_fin VARCHAR(255),id_Salle VARCHAR(255));


CREATE TABLE Salle(id_Salle VARCHAR(255) PRIMARY KEY ,nom_Salle  VARCHAR(255),capacite_Salle VARCHAR(255));

CREATE TABLE License(id_License VARCHAR(255) PRIMARY KEY,nom_License VARCHAR(255));

ALTER TABLE Emplois ADD id_License VARCHAR(255);

ALTER TABLE Cours ADD id_License VARCHAR(255);
