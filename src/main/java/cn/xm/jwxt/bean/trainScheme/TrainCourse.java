package cn.xm.jwxt.bean.trainScheme;

public class TrainCourse {
    private Integer traincourseid;

    private String trainningschemeid;

    private String courseid;

    private String typenum;

    private Short semester;

    private String coursetype;

    public Integer getTraincourseid() {
        return traincourseid;
    }

    public void setTraincourseid(Integer traincourseid) {
        this.traincourseid = traincourseid;
    }

    public String getTrainningschemeid() {
        return trainningschemeid;
    }

    public void setTrainningschemeid(String trainningschemeid) {
        this.trainningschemeid = trainningschemeid == null ? null : trainningschemeid.trim();
    }

    public String getCourseid() {
        return courseid;
    }

    public void setCourseid(String courseid) {
        this.courseid = courseid == null ? null : courseid.trim();
    }

    public String getTypenum() {
        return typenum;
    }

    public void setTypenum(String typenum) {
        this.typenum = typenum == null ? null : typenum.trim();
    }

    public Short getSemester() {
        return semester;
    }

    public void setSemester(Short semester) {
        this.semester = semester;
    }

    public String getCoursetype() {
        return coursetype;
    }

    public void setCoursetype(String coursetype) {
        this.coursetype = coursetype == null ? null : coursetype.trim();
    }
}