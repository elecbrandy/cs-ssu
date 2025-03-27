# CS-SSU

> 숭실대학교 2025-1 컴퓨터구조 arm 어셈블리어 실습 레포지토리

<br>

## 1. 실행 환경 구축

> [!IMPORTANT]  
> m1 맥북 환경에서 실습하는 경우를 위한 문서입니다.

실습에 앞서, **Docker + QEMU + GDB** 환경에서 ARM 어셈블리 실습을 할 수 있도록 환경을 구축하는 과정을 설명하겠습니다. 두 개의 터미널을 이용해 ARM 바이너리를 실행하고, GDB를 통해 디버깅하는 과정을 입니다.
지침 상 UTM 등을 통한 가상환경을 말씀하셨지만, m1의 경우 arm 기반이기도 하고 도커로 실습하는게 더 빠르고 간편할 것이라고 판단했습니다.

<br>

## 2. 실습 환경 구성도
``` bash
[Docker (Ubuntu 22.04)]
   ↓
[QEMU (ARM 에뮬레이터)]
   ↓
[GDB (디버깅 툴)]
```

<br>

## 3. 사전 준비
- 매 과제는 압축파일로 주어집니다. 과제를 다운받아 압축을 풀고 `/templates` 디렉토리 내부에 넣어줍시다.
- Makefile 내부 `HOST_CODE_PATH` 를 본인 컴퓨터 환경에 맞게 설정해주세요.
   - 도커 컨테이너와 물릴 로컬 환경의 디렉토리를 적으면 됩니다.
   - `HOST_CODE_PATH = /Users/username/project/cs-ssu`
- 이후 `make build` 를 통해 도커 이미지를 만들어줍시다.

<br>

## 4. 실습 순서

#### 터미널 1: QEMU를 디버깅 대기 상태로 실행
- 아래 명령어를 차례대로 실행을 마치면, QEMU가 **대기 중**인 상태일 것입니다.
- 이 터미널은 열어둔 채, `gdb`를 위한 새 터미널을 열고 다음 단계를 진행하면 됩니다.

```bash
# 1. 컨테이너 내부 bash 진입
make run

# 2. 실습 디렉토리로 이동
cd <subject path>    # 예시: cd /lab0

# 3. ARM 바이너리 컴파일
# 예시: arm-linux-gnueabihf-gcc -static -g -o lab0 main.c assem.S
arm-linux-gnueabihf-gcc -static -g -o ./my_program ./myfile1 ./myfile2 ...

# 4. QEMU로 디버깅 대기 실행 (포트 1234)
qemu-arm -g 1234 ./my_program
```

#### 터미널 2: GDB로 QEMU에 연결
```bash
# 1. 같은 컨테이너에 다시 진입
make run

# 2. GDB 실행(layout 기능을 사용하기 위한 tui 옵션)
gdb-multiarch -tui ./my_program
```

<br>

## 5. GDB 명령어

| 명령어 | 설명 |
|--------|------|
| `break <함수명>` | 해당 함수에 브레이크포인트 설정 |
| `continue` | 실행 계속 |
| `step` / `next` | 다음 명령어 실행 (step은 함수 내부 진입) |
| `info registers` | 레지스터 전체 확인 |
| `x/4xw $sp` | 스택 포인터 기준으로 메모리 확인 |
| `disassemble` | 어셈블리 코드 보기 |
| `disassemble` | 어셈블리 코드 보기 |
| `layout src` | 소스 코드 보기 |
| `layout asm` | 어셈블리 창 보기 |
| `layout regs` | 레지스터 창 보기 |
