package com.gmweb.app.service.support;

public final class CpfValidator {

    private CpfValidator() {
    }

    public static boolean isValid(String cpf) {
        if (cpf == null) {
            return false;
        }
        String digits = cpf.replaceAll("\\D", "");
        if (digits.length() != 11) {
            return false;
        }
        if (digits.chars().distinct().count() == 1) {
            return false;
        }
        try {
            int dv1 = calculateDigit(digits, 9, 10);
            int dv2 = calculateDigit(digits, 10, 11);
            return digits.charAt(9) == (char) ('0' + dv1) && digits.charAt(10) == (char) ('0' + dv2);
        } catch (NumberFormatException ex) {
            return false;
        }
    }

    private static int calculateDigit(String digits, int length, int weightStart) {
        int total = 0;
        for (int i = 0; i < length; i++) {
            int numero = digits.charAt(i) - '0';
            total += numero * (weightStart - i);
        }
        int resto = total % 11;
        return resto > 1 ? 11 - resto : 0;
    }
}
