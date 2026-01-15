package com.parking.parkinglot.common;

public class CarPhotoDto {
    private Long id;
    private byte[] fileContent;
    private String fileType;
    private String filename;

    public CarPhotoDto(Long id, String filename, String fileType, byte[] fileContent) {
        this.id = id;
        this.fileContent = fileContent;
        this.fileType = fileType;
        this.filename = filename;
    }

    public Long getId() {
        return id;
    }

    public byte[] getFileContent() {
        return fileContent;
    }

    public String getFileType() {
        return fileType;
    }

    public String getFilename() {
        return filename;
    }
}
