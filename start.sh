#!/bin/sh

chmod +x windisc.sh |

chmod +x winstartkvm.sh |

chmod +x win95.sh |

chmod +x w95cpu.sh |

chmod +x winstartnokvm.sh |

wget 'https://dl-alt1.winworldpc.com/Microsoft%20Windows%2095B%20(4.00.1111)%20(OSR2)%20[English]%20(CD).7z' -O ./instdisc.7z &&

7z e ./instdisc.7z &&

rm ./instdisc.7z |

rm -r 'Microsoft Windows 95B (4.00.1111) (OSR2) [English] (CD)' |

rm winworldpc.com.txt &&

	./windisc.sh &&
	./win95.sh &&
	./win95.sh &&
	./winstartnokvm.sh
