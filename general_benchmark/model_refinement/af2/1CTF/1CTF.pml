# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5779365398388363

load 1CTF.pdb, 1CTF
bg_color white
hide everything, 1CTF
show cartoon, 1CTF
color grey80, 1CTF
set cartoon_transparency, 0.1

select worst_residues, 1CTF and resi 8+9+10+11+21+22+23+46+60+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CTF and resi 9 and name CA, 1CTF and resi 48 and name CA  # target=22.699929335854836 current=23.81540716812991
color yellow, pair_00
distance pair_01, 1CTF and resi 9 and name CA, 1CTF and resi 47 and name CA  # target=22.947697677859143 current=24.02139149819143
color yellow, pair_01
distance pair_02, 1CTF and resi 1 and name CA, 1CTF and resi 9 and name CA  # target=21.532630446032716 current=22.54260926328559
color yellow, pair_02
distance pair_03, 1CTF and resi 9 and name CA, 1CTF and resi 45 and name CA  # target=22.5267484654048 current=23.532458604697926
color yellow, pair_03
distance pair_04, 1CTF and resi 9 and name CA, 1CTF and resi 49 and name CA  # target=20.987562402520236 current=21.96893367270406
color yellow, pair_04
distance pair_05, 1CTF and resi 28 and name CA, 1CTF and resi 47 and name CA  # target=26.716558664738166 current=27.691229651777004
color yellow, pair_05
distance pair_06, 1CTF and resi 9 and name CA, 1CTF and resi 46 and name CA  # target=24.32012167888458 current=25.27673795058486
color yellow, pair_06
distance pair_07, 1CTF and resi 10 and name CA, 1CTF and resi 46 and name CA  # target=26.76726118037176 current=27.710491465878118
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
