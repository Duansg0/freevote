package com.freevote.dto;

import java.io.Serializable;

/**
 * @author Duansg
 * @date 2019-9-02
 * @dec 图片裁剪数据
 */
public class ImgDto implements Serializable {

    private static final long serialVersionUID = -3762237300364195190L;

    private ImgDto() {

    }

    public ImgDto(String fromFileStr, String saveToFileStr, String sysimgfile, Integer width, Integer height, String suffix) {
        this.fromFileStr = fromFileStr;
        this.saveToFileStr = saveToFileStr;
        this.sysimgfile = sysimgfile;
        this.width = width;
        this.height = height;
        this.suffix = suffix;
    }

    /**
     * 原始图片完整路径
     */
    private String fromFileStr;
    /**
     * 缩略图片保存路径
     */
    private String saveToFileStr;
    /**
     * 处理后的图片文件名前缀
     */
    private String sysimgfile;
    /**
     * 处理后的图片的宽度
     */
    private Integer width;
    /**
     * 处理后的图片高度
     */
    private Integer height;
    /**
     * 处理后的图片后缀
     */
    private String suffix;

    public String getFromFileStr() {
        return fromFileStr;
    }

    public void setFromFileStr(String fromFileStr) {
        this.fromFileStr = fromFileStr;
    }

    public String getSaveToFileStr() {
        return saveToFileStr;
    }

    public void setSaveToFileStr(String saveToFileStr) {
        this.saveToFileStr = saveToFileStr;
    }

    public String getSysimgfile() {
        return sysimgfile;
    }

    public void setSysimgfile(String sysimgfile) {
        this.sysimgfile = sysimgfile;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }
}
