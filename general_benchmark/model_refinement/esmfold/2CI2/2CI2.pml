# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.38225857711075606

load 2CI2.pdb, 2CI2
bg_color white
hide everything, 2CI2
show cartoon, 2CI2
color grey80, 2CI2
set cartoon_transparency, 0.1

select worst_residues, 2CI2 and resi 1+35+36+37+39+40+41+53+54+59
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CI2 and resi 1 and name CA, 2CI2 and resi 53 and name CA  # target=27.301840530585846 current=29.91535690531369
color yellow, pair_00
distance pair_01, 2CI2 and resi 1 and name CA, 2CI2 and resi 54 and name CA  # target=27.207270024823394 current=29.34506625160186
color yellow, pair_01
distance pair_02, 2CI2 and resi 44 and name CA, 2CI2 and resi 54 and name CA  # target=26.598662843580563 current=27.62561365463818
color yellow, pair_02
distance pair_03, 2CI2 and resi 22 and name CA, 2CI2 and resi 37 and name CA  # target=26.44544862767715 current=27.37673035867923
color yellow, pair_03
distance pair_04, 2CI2 and resi 41 and name CA, 2CI2 and resi 54 and name CA  # target=26.509461358670933 current=27.43173221788071
color yellow, pair_04
distance pair_05, 2CI2 and resi 42 and name CA, 2CI2 and resi 54 and name CA  # target=26.39671281078248 current=27.275219254995864
color yellow, pair_05
distance pair_06, 2CI2 and resi 19 and name CA, 2CI2 and resi 41 and name CA  # target=23.20858428911112 current=24.063278571843064
color yellow, pair_06
distance pair_07, 2CI2 and resi 19 and name CA, 2CI2 and resi 38 and name CA  # target=22.608008926322366 current=23.413415618173737
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
