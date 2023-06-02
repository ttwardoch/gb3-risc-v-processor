
int main(void)
{
	/*
	 *	Reading from the special address pointed to by
	 *	gDebugLedsMemoryMappedRegister will cause the processor to
	 *	set the value of 8 of the FPGA's pins to the byte written
	 *	to the address. See the PCF file for how those 8 pins are
	 *	mapped.
	 */
	enum
	{
		kSpinDelay = 800000,
	};
	int A = 1073741823;
	int B = 1073741823;
	int C = 2147483647;
	int D = 2147483647;

	volatile unsigned int *gDebugLedsMemoryMappedRegister = (unsigned int *)0x2000;
	while (1)
	{
		*gDebugLedsMemoryMappedRegister = 0xFF;

		/*
		 *	Spin
		 */
		for (int j = 0; j < kSpinDelay; j++)
			;
		
		if(A + B == 2147483646 && C - D == 0){
			// Blink only if test is passed
			*gDebugLedsMemoryMappedRegister = 0x00;
		}
		

		/*
		 *	Spin
		 */
		for (int j = 0; j < kSpinDelay; j++)
			;
	}
}
