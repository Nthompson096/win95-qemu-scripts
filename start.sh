#!/bin/sh

chmod +x windisc.sh |

chmod +x winstart.sh |

chmod +x win95.sh |

wget 'https://dl-alt1.winworldpc.com/Microsoft%20Windows%2095%20OSR2%20-%20Boot%20Disk%20(Dell%20OEM)%20(3.5-1.44mb).7z' -O ./bootdisc.7z |

wget 'https://dl-alt1.winworldpc.com/Microsoft%20Windows%2095B%20(4.00.1111)%20(OSR2)%20[English]%20(CD).7z' -O ./instdisc.7z &&


7z e ./instdisc.7z &&

7z e ./bootdisc.7z &&

rm ./instdisc.7z |

rm -r 'Microsoft Windows 95 OSR2 - Boot Disk (Dell OEM) (3.5-1.44mb)' |

rm -r 'Microsoft Windows 95B (4.00.1111) (OSR2) [English] (CD)' |

rm winworldpc.com.txt |

rm media-disk01.jpg |

rm ./bootdisc.7z &&

	./windisc.sh &&
	./win95.sh &&
	./win95.sh &&
	./winstart.sh
