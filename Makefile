#===============================================================================
# WDC Tools Assembler Definitions
#-------------------------------------------------------------------------------

AS			=	wdc816as

LD			=	wdcln

RM			=	erase

AS_FLAGS	=	-g -l -DW65C816SXB

LD_FLAGS	=	-g -t -C0300

DEBUG		=	wdcdb.exe

#===============================================================================
# Rules
#-------------------------------------------------------------------------------

.asm.obj:
		$(AS) $(AS_FLAGS) $<

#===============================================================================
# Targets
#-------------------------------------------------------------------------------

OBJS	= \
		w65c816sxb.obj \
		sxb-hacker.obj

all:	sxb-hacker.bin

clean:
		$(RM) $(OBJS)
		$(RM) *.bin
		$(RM) *.lst
		$(RM) *.map
		$(RM) *.sym

debug:
		$(DEBUG)

#===============================================================================
# Dependencies
#-------------------------------------------------------------------------------

sxb-hacker.bin: $(OBJS)
		$(LD) $(LD_FLAGS) -O $@ $(OBJS)

w65c816sxb.obj: \
		w65c816.inc \
		w65c816sxb.inc \
		w65c816sxb.asm

sxb-hacker.obj: \
		w65c816.inc \
		sxb-hacker.asm
