.text
.global copy_array
.type copy_array,STT_FUNC

copy_array:
  sub sp, sp, #8
  str r3, [sp, #0]
  str r4, [sp, #4]
  mov r4, #0

cwhile:
  cmp r2, r4
  ble cexit
  ldr r3, [r0, r4, lsl#2]
  str r3, [r1, r4, lsl#2]
  add r4, r4, #1
  b cwhile

cexit:
  ldr r4, [sp, #4]
  ldr r3, [sp, #0]
  add sp, sp, #8
  mov pc, lr

.end
