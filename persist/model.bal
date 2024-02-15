import ballerina/persist as _;
import ballerina/time;
import ballerinax/persist.sql;

public enum AppointmentStatus {
    SCHEDULED = "SCHEDULED",
    STARTED = "STARTED",
    ENDED = "ENDED"
}

public enum PatientGender {
    MALE = "MALE",
    FEMALE = "FEMALE"
}

@sql:Mapping {name: "appointment"}
public type Appointment record {|
    readonly int id;
    @sql:UniqueIndex {name: "reason_index"}
    string reason;
    time:Civil appointmentTime;
    AppointmentStatus status;
    @sql:Mapping {name: "patientId"}
    @sql:Index {name: "patientId"}
    int _patientId;
    @sql:Mapping {name: "doctorId"}
    @sql:Index {name: "doctorId"}
    int _doctorId;
    @sql:Relation {refs: ["_patientId"]}
    Patient patient;
    @sql:Relation {refs: ["_doctorId"]}
    Doctor doctor;
|};

@sql:Mapping {name: "patients"}
public type Patient record {|
    @sql:Generated
    readonly int id;
    string name;
    int age;
    @sql:Mapping {name: "ADDRESS"}
    string address;
    @sql:Char {length: 10}
    string phoneNumber;
    PatientGender gender;
    Appointment[] appointments;
|};

public type Doctor record {|
    readonly int id;
    string name;
    @sql:Index {name: "specialty_index"}
    string specialty;
    @sql:Mapping {name: "phone_number"}
    string phoneNumber;
    Appointment[] appointments;
|};

