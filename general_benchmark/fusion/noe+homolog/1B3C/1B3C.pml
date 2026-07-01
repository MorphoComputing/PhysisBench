# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.806714354094481

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 6+7+13+29+30+32+33+50+54+60
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1B3C and resi 5+29+34
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1B3C and resi 10 and name CA, 1B3C and resi 56 and name CA  # target=4.647636918307805 current=7.468063957369185
color yellow, pair_00
distance pair_01, 1B3C and resi 3 and name CA, 1B3C and resi 46 and name CA  # target=4.028908588844348 current=6.841060163543075
color yellow, pair_01
distance pair_02, 1B3C and resi 17 and name CA, 1B3C and resi 43 and name CA  # target=5.1756846552692375 current=7.814425095024966
color yellow, pair_02
distance pair_03, 1B3C and resi 14 and name CA, 1B3C and resi 39 and name CA  # target=4.368633443260828 current=6.967692440545085
color yellow, pair_03
distance pair_04, 1B3C and resi 1 and name CA, 1B3C and resi 48 and name CA  # target=4.028908588844348 current=6.467782478731926
color yellow, pair_04
distance pair_05, 1B3C and resi 15 and name CA, 1B3C and resi 42 and name CA  # target=5.713081305182573 current=8.008900292101696
color yellow, pair_05
distance pair_06, 1B3C and resi 32 and name CA, 1B3C and resi 53 and name CA  # target=6.154433278656084 current=8.408795346549985
color yellow, pair_06
distance pair_07, 1B3C and resi 13 and name CA, 1B3C and resi 43 and name CA  # target=4.028908588844348 current=6.258817376026834
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
