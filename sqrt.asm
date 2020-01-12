/* Square root for the C= 64 using no multiplication */
.pc = $801 "Basic"
:BasicUpstart(main)
.pc = $80d "Program"
main: { 
    jsr isqrt
    rts
}
isqrt: {
    .const delta = 3
    .const a = 8
    .label x = 6
    .label xsqr = 2
    lda #1
    sta.z x
    lda #0
    sta.z x+1
    sta.z x+2
    sta.z x+3
    lda #1
    sta.z xsqr
    lda #0
    sta.z xsqr+1
    sta.z xsqr+2
    sta.z xsqr+3
  __b1:
    lda.z xsqr+3
    cmp #>a+1>>$10
    bcc __b2
    bne !+
    lda.z xsqr+2
    cmp #<a+1>>$10
    bcc __b2
    bne !+
    lda.z xsqr+1
    cmp #>a+1
    bcc __b2
    bne !+
    lda.z xsqr
    cmp #<a+1
    bcc __b2
  !:
    rts
  __b2:
    inc.z x
    bne !+
    inc.z x+1
    bne !+
    inc.z x+2
    bne !+
    inc.z x+3
  !:
    lda.z xsqr
    clc
    adc #<delta
    sta.z xsqr
    lda.z xsqr+1
    adc #>delta
    sta.z xsqr+1
    lda.z xsqr+2
    adc #<delta>>$10
    sta.z xsqr+2
    adc #<delta>>$10
    sta.z xsqr+2
    lda.z xsqr+3
    adc #>delta>>$10
    sta.z xsqr+3
    jmp __b1
}
