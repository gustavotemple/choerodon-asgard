package io.choerodon.asgard.infra.enums;

/**
 * @author dengyouquan
 **/
public enum MemberType {
    USER("user"),
    ROLE("role");
    private String value;

    public String value() {
        return value;
    }

    MemberType(String value) {
        this.value = value;
    }
}
