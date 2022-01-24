#!/bin/sh

chmod +x windisc.sh |

chmod +x winstartkvm.sh |

chmod +x win95.sh |

chmod +x w95cpu.sh |

chmod +x winstartnokvm.sh |

chmod +x ff95.sh |

chmod +x ie95.sh |

wget 'https://dl-alt1.winworldpc.com/Microsoft%20Windows%2095B%20(4.00.1111)%20(OSR2)%20[English]%20(CD).7z' -O ./instdisc.7z &&

wget 'https://archive.org/download/ie4-win95-winnt/Internet%20Explorer%204.0%20for%20Windows%2095%20and%20NT%204.0.iso' -O ./iew95.iso &&

7z e ./instdisc.7z &&

rm ./instdisc.7z |

rm -r 'Microsoft Windows 95B (4.00.1111) (OSR2) [English] (CD)' |

rm winworldpc.com.txt &&

	./windisc.sh &&
	./win95.sh &&
	./win95.sh &&
	./winstartnokvm.sh
