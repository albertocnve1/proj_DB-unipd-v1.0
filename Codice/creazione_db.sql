CREATE TABLE Aeroporti (
    AirportID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Città VARCHAR(255),
    Stato VARCHAR(255),
    CodiceICAO VARCHAR(4),
    CodiceIATA VARCHAR(3)
);
CREATE TABLE CompagnieAeree (
    AirlineID INT PRIMARY KEY,
    Nome VARCHAR(255),
    CodiceIATA VARCHAR(3),
    CodiceICAO VARCHAR(4),
    Stato VARCHAR(255)
);

CREATE TABLE Aerei (
    AircraftID VARCHAR(6) PRIMARY KEY,
    Modello VARCHAR(255),
    Costruttore VARCHAR(255),
    Capacità INT,
    CompagniaAereaID INT,
    FOREIGN KEY (CompagniaAereaID) REFERENCES CompagnieAeree(AirlineID)
);
CREATE TABLE Gates (
    GateID INT PRIMARY KEY,
    Terminal VARCHAR(255),
    Numero INT,
    AirportID INT,
    FOREIGN KEY (AirportID) REFERENCES Aeroporti(AirportID)
);

CREATE TABLE Voli (
    FlightID INT PRIMARY KEY,
    NumeroVolo VARCHAR(255),
    DataOraPartenza TIMESTAMP,
    DataOraArrivo TIMESTAMP,
    AeroportoPartenzaID INT,
    AeroportoArrivoID INT,
    CompagniaAereaID INT,
    AircraftID VARCHAR(6),
    GatePartenzaID INT,
    GateArrivoID INT,
    FOREIGN KEY (AeroportoPartenzaID) REFERENCES Aeroporti(AirportID),
    FOREIGN KEY (AeroportoArrivoID) REFERENCES Aeroporti(AirportID),
    FOREIGN KEY (CompagniaAereaID) REFERENCES CompagnieAeree(AirlineID),
    FOREIGN KEY (AircraftID) REFERENCES Aerei(AircraftID),
    FOREIGN KEY (GatePartenzaID) REFERENCES Gates(GateID),
    FOREIGN KEY (GateArrivoID) REFERENCES Gates(GateID)
);

CREATE TABLE Passeggeri (
    PasseggeroID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Cognome VARCHAR(255),
    DataDiNascita DATE,
    Nazionalità VARCHAR(255),
    DocumentoIdentità VARCHAR(255)
);

CREATE TABLE Prenotazioni (
    NumeroBiglietto VARCHAR(255) PRIMARY KEY,
    PasseggeroID INT,
    FlightID INT,
    Classe VARCHAR(255),
    Prezzo DECIMAL(10, 2),
    FOREIGN KEY (PasseggeroID) REFERENCES Passeggeri(PasseggeroID),
    FOREIGN KEY (FlightID) REFERENCES Voli(FlightID)
);

CREATE TABLE Equipaggio (
    CrewID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Cognome VARCHAR(255),
    Ruolo VARCHAR(255),
    CompagniaAereaID INT,
    FOREIGN KEY (CompagniaAereaID) REFERENCES CompagnieAeree(AirlineID)
);

CREATE TABLE AssegnazioneEquipaggio (
    AssignmentID INT PRIMARY KEY,
    FlightID INT,
    CrewID INT,
    FOREIGN KEY (FlightID) REFERENCES Voli(FlightID),
    FOREIGN KEY (CrewID) REFERENCES Equipaggio(CrewID)
);
