#!/bin/sh

chmod +x windisc.sh |

chmod +x winstartkvm.sh |

chmod +x win95.sh |

chmod +x w95cpu.sh |

chmod +x winstartnokvm.sh

wget 'https://winworldpc.com/download/db57f85a-f039-11e7-a562-fa163e9022f0/from/c39ac2af-c381-c2bf-1b25-11c3a4e284a2' -O ./bootdisc.7z |

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
	./winstartnokvm.sh
