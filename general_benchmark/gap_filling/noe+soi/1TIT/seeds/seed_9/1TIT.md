# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1TIT\seeds\seed_9\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 13.917 A
- tm_score_ca_ordered: 0.11335034174935776
- heavy_atom_rmsd: 14.879 A
- sidechain_heavy_atom_rmsd: 15.797 A
- **all-atom quality (honest):** heavy 14.879 A, sidechain 15.797 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 35
- distogram_pairs: 513
- bin_accuracy: 0.238

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** W33-K34 → 200 conflicts (20%); H55-L57 → 133 conflicts (14%); F20-I22 → 83 conflicts (8%)
- explained: 416/984 conflicts by 3 root cause(s)
- metrics: hubs=72 (frac 0.828), conflicts/hub=13.7, max_incompat=26.21Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): W33-K34 + H55-L57 + F20-I22 — explain ~416/984 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W33** — severity 129.06, 76 conflict(s); suspect input ~`I48` (group: push_out)
  - pull-in (wants closer): G37@9.1Å(now 12.1,conf 0.58), F72@3.8Å(now 8.1,conf 0.47), Q73@4.7Å(now 12.4,conf 0.38), H55@4.9Å(now 7.5,conf 0.35), F20@5.0Å(now 9.1,conf 0.27), L7@5.2Å(now 17.1,conf 0.26), I22@5.2Å(now 8.0,conf 0.26), I48@5.2Å(now 14.2,conf 0.26), I56@5.2Å(now 9.3,conf 0.26)
  - push-out (wants farther): P27@11.5Å(now 5.8,conf 0.52), E26@15.3Å(now 8.6,conf 0.40)
  - L7↔I48: targets 5.2/5.2Å but partners are 30.1Å apart → too_far_apart by 19.8Å
  - L7↔I56: targets 5.2/5.2Å but partners are 26.2Å apart → too_far_apart by 15.8Å
  - G37↔L7: targets 9.1/5.2Å but partners are 28.9Å apart → too_far_apart by 14.6Å
- **F20** — severity 108.59, 49 conflict(s); suspect input ~`I58` (group: push_out)
  - pull-in (wants closer): E16@9.7Å(now 16.7,conf 0.52), L57@4.3Å(now 14.6,conf 0.41), I58@4.5Å(now 13.7,conf 0.39), L7@4.7Å(now 8.5,conf 0.37), A81@4.7Å(now 9.4,conf 0.37), Y8@5.0Å(now 11.5,conf 0.27), W33@5.0Å(now 9.1,conf 0.27), L83@5.4Å(now 9.3,conf 0.24), G9@5.5Å(now 11.2,conf 0.24), V10@5.5Å(now 9.6,conf 0.24)
  - push-out (wants farther): E26@12.2Å(now 7.8,conf 0.69), P27@10.1Å(now 7.2,conf 0.69), S25@11.3Å(now 8.4,conf 0.67), E23@9.6Å(now 6.1,conf 0.59), L24@10.2Å(now 5.3,conf 0.40)
  - E16↔L57: targets 9.7/4.3Å but partners are 30.9Å apart → too_far_apart by 16.8Å
  - E16↔I58: targets 9.7/4.5Å but partners are 29.9Å apart → too_far_apart by 15.8Å
  - L57↔L7: targets 4.3/4.7Å but partners are 22.6Å apart → too_far_apart by 13.6Å
- **H55** — severity 89.50, 32 conflict(s); suspect input ~`L24` (group: push_out)
  - pull-in (wants closer): I49@7.5Å(now 10.9,conf 0.82), E50@4.0Å(now 10.3,conf 0.45), I22@4.3Å(now 14.5,conf 0.41), D51@4.7Å(now 8.3,conf 0.38), E23@4.7Å(now 12.8,conf 0.37), L24@4.8Å(now 15.1,conf 0.36), G31@4.9Å(now 10.1,conf 0.35), W33@4.9Å(now 7.5,conf 0.35), F72@5.8Å(now 9.3,conf 0.23)
  - push-out (wants farther): I58@9.6Å(now 6.4,conf 0.59)
  - E50↔I22: targets 4.0/4.3Å but partners are 23.7Å apart → too_far_apart by 15.4Å
  - E50↔L24: targets 4.0/4.8Å but partners are 23.7Å apart → too_far_apart by 14.9Å
  - I22↔D51: targets 4.3/4.7Å but partners are 22.6Å apart → too_far_apart by 13.6Å
- **E23** — severity 89.01, 26 conflict(s); suspect input ~`K54` (group: pull_in)
  - pull-in (wants closer): E16@13.2Å(now 19.3,conf 0.49), K54@4.0Å(now 17.3,conf 0.45), K5@4.3Å(now 18.2,conf 0.41), H55@4.7Å(now 12.8,conf 0.37)
  - push-out (wants farther): P27@7.0Å(now 3.2,conf 0.66), F20@9.6Å(now 6.1,conf 0.59), E26@6.4Å(now 2.1,conf 0.52)
  - K54↔K5: targets 4.0/4.3Å but partners are 34.6Å apart → too_far_apart by 26.2Å
  - E16↔K54: targets 13.2/4.0Å but partners are 36.3Å apart → too_far_apart by 19.1Å
  - K5↔H55: targets 4.3/4.7Å but partners are 30.2Å apart → too_far_apart by 21.2Å
- **V70** — severity 87.75, 41 conflict(s); suspect input ~`L7` (group: pull_in)
  - pull-in (wants closer): L35@4.0Å(now 13.0,conf 0.45), A81@4.1Å(now 9.3,conf 0.43), N82@4.2Å(now 10.0,conf 0.43), L7@4.5Å(now 11.8,conf 0.39), K34@5.1Å(now 10.1,conf 0.27)
  - L35↔L7: targets 4.0/4.5Å but partners are 23.8Å apart → too_far_apart by 15.2Å
  - L35↔A81: targets 4.0/4.1Å but partners are 20.2Å apart → too_far_apart by 12.1Å
  - L35↔N82: targets 4.0/4.2Å but partners are 18.5Å apart → too_far_apart by 10.3Å
- **L24** — severity 86.42, 29 conflict(s); suspect input ~`E4` (group: pull_in)
  - pull-in (wants closer): V3@3.9Å(now 10.2,conf 0.47), E4@4.0Å(now 18.1,conf 0.45), H55@4.8Å(now 15.1,conf 0.36), F72@5.1Å(now 8.7,conf 0.27), K5@5.2Å(now 15.7,conf 0.26)
  - push-out (wants farther): E21@9.8Å(now 6.9,conf 0.52), F20@10.2Å(now 5.3,conf 0.40), T17@13.2Å(now 9.3,conf 0.34), H19@11.8Å(now 6.7,conf 0.34), A18@12.0Å(now 7.7,conf 0.26)
  - E4↔H55: targets 4.0/4.8Å but partners are 32.8Å apart → too_far_apart by 23.9Å
  - V3↔H55: targets 3.9/4.8Å but partners are 25.1Å apart → too_far_apart by 16.4Å
  - G31↔E4: targets 10.1/4.0Å but partners are 26.8Å apart → too_far_apart by 12.7Å

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=38 · 3-10(G)=7 · coil(C)=6

```
CEHHEHHHEHHHHHEGGECCEEEGHHEHEGHCEEEHGEHEEHEHEEEECEEHHHGHHHEEHHEEHEHEEGEECHEHHEEHEHHHHEE
```

## Backbone H-bond Network

- total=142 · helix(i→i+4)=11 · sheet=131
  - V3 ↔ L7  (helix)
  - E4 ↔ Y8  (helix)
  - P6 ↔ V10  (helix)
  - Y8 ↔ V12  (helix)
  - V10 ↔ V14  (helix)
  - G52 ↔ I56  (helix)
  - K53 ↔ L57  (helix)
  - L57 ↔ N61  (helix)
  - N61 ↔ G65  (helix)
  - N76 ↔ A80  (helix)
  - A80 ↔ K84  (helix)
  - E2 ↔ G9  (sheet)
  - E2 ↔ G15  (sheet)
  - E2 ↔ A18  (sheet)
  - K5 ↔ G15  (sheet)
  - K5 ↔ A18  (sheet)
  - G9 ↔ G15  (sheet)
  - G9 ↔ A18  (sheet)
  - G9 ↔ I22  (sheet)
  - G15 ↔ I22  (sheet)
  - … +122 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=512 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=327 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=7.1379 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=35 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
