package entidad;

public class ExamMedicos {


    private int codexamen;
    private String descexam;
    private String fechaexam;
    private String fotoexam;
    private Doctor doctor;
    
        /**
     * @return the doctor
     */
    public Doctor getDoctor() {
        return doctor;
    }

    /**
     * @param doctor the doctor to set
     */
    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public int getCodexamen() {
        return codexamen;
    }

    public void setCodexamen(int codexamen) {
        this.codexamen = codexamen;
    }

    public String getDescexam() {
        return descexam;
    }

    public void setDescexam(String descexam) {
        this.descexam = descexam;
    }

    public String getFechaexam() {
        return fechaexam;
    }

    public void setFechaexam(String fechaexam) {
        this.fechaexam = fechaexam;
    }

    public String getFotoexam() {
        return fotoexam;
    }

    public void setFotoexam(String fotoexam) {
        this.fotoexam = fotoexam;
    }    
    
}
