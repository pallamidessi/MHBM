/**
 * @file mhbm.c
 * @author Pallamidessi Joseph
 * @version 1.0
 *
 * @section LICENSE
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details at
 * http://www.gnu.org/copyleft/gpl.html
**/	
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
	
	int fd_buffer_info=0;
	int current_buffer=0;


	if (argc < 3) {
		perror("usage: %s buffer_info command",argv[0]);	
		exit 1;
	}

	if ((fd_buffer_info=open("~/.mhbm/buffer_info",O_RDWR|O_APPEND))==-1){
		
		/*Create conf files if missing or first use of this program*/
		mkdir("~/.mhbm/",0733);
		fd_buffer_info=creat("~/.mhbm/buffer_info",0733);
		write(fd_buffer_info,&current_buffer,sizeof(int));
	}

	if (read(fd_buffer_info,&current_buffer,sizeof(int))==-1) {
		perror("Cannot read buffer_info ");
		exit 3;
	}

	if () {
		
	}

	return 0;
}
