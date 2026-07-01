# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1VII\seeds\seed_2\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 4.650 A
- tm_score_ca_ordered: 0.1891465948498102
- heavy_atom_rmsd: 6.284 A
- sidechain_heavy_atom_rmsd: 7.421 A
- **all-atom quality (honest):** heavy 6.284 A, sidechain 7.421 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 162
- bin_accuracy: 0.519

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F17-G33 → 80 conflicts (98%)
- explained: 80/82 conflicts by 1 root cause(s)
- metrics: hubs=10 (frac 0.294), conflicts/hub=8.2, max_incompat=5.96Å, chain_span=0.912
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F17-G33 — explain ~80/82 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q26** — severity 30.58, 17 conflict(s); suspect input ~`L22` (group: pull_in)
  - pull-in (wants closer): P21@4.4Å(now 7.0,conf 0.69), G33@7.8Å(now 12.4,conf 0.67), K32@6.2Å(now 9.8,conf 0.52), K30@4.0Å(now 7.0,conf 0.45)
  - P21↔G33: targets 4.4/7.8Å but partners are 18.1Å apart → too_far_apart by 6.0Å
  - P21↔E31: targets 4.4/5.3Å but partners are 14.6Å apart → too_far_apart by 5.0Å
  - P21↔K32: targets 4.4/6.2Å but partners are 16.2Å apart → too_far_apart by 5.5Å
- **L28** — severity 26.11, 16 conflict(s); suspect input ~`G33` (group: pull_in)
  - pull-in (wants closer): P21@6.8Å(now 9.9,conf 0.82), G33@6.4Å(now 9.2,conf 0.67), K32@4.0Å(now 6.6,conf 0.45), L20@5.2Å(now 8.4,conf 0.26)
  - P21↔G33: targets 6.8/6.4Å but partners are 18.1Å apart → too_far_apart by 5.0Å
  - P21↔L34: targets 6.8/9.2Å but partners are 20.3Å apart → too_far_apart by 4.3Å
  - P21↔K32: targets 6.8/4.0Å but partners are 16.2Å apart → too_far_apart by 5.3Å
- **N27** — severity 21.50, 14 conflict(s); suspect input ~`W23` (group: pull_in)
  - pull-in (wants closer): L22@6.6Å(now 9.2,conf 0.79), L34@10.3Å(now 14.1,conf 0.69), G33@8.2Å(now 11.6,conf 0.52), W23@4.0Å(now 7.5,conf 0.45)
  - L22↔L34: targets 6.6/10.3Å but partners are 20.4Å apart → too_far_apart by 3.6Å
  - K32↔L22: targets 6.5/6.6Å but partners are 15.7Å apart → too_far_apart by 2.7Å
  - P21↔L34: targets 7.1/10.3Å but partners are 20.3Å apart → too_far_apart by 2.9Å
- **Q25** — severity 15.96, 11 conflict(s); suspect input ~`L22` (group: pull_in)
  - pull-in (wants closer): K32@7.1Å(now 11.7,conf 0.94), E31@6.9Å(now 9.6,conf 0.67), L22@4.0Å(now 7.1,conf 0.45)
  - K32↔P21: targets 7.1/4.0Å but partners are 16.2Å apart → too_far_apart by 5.1Å
  - P21↔E31: targets 4.0/6.9Å but partners are 14.6Å apart → too_far_apart by 3.7Å
  - K32↔L22: targets 7.1/4.0Å but partners are 15.7Å apart → too_far_apart by 4.6Å
- **R14** — severity 13.05, 9 conflict(s); suspect input ~`D3` (group: pull_in)
  - pull-in (wants closer): K7@5.6Å(now 8.4,conf 0.69), D3@5.2Å(now 8.2,conf 0.26)
  - N19↔K7: targets 9.1/5.6Å but partners are 19.4Å apart → too_far_apart by 4.7Å
  - K7↔A18: targets 5.6/7.6Å but partners are 17.0Å apart → too_far_apart by 3.8Å
  - K7↔F17: targets 5.6/4.0Å but partners are 13.4Å apart → too_far_apart by 3.7Å
- **F17** — severity 7.35, 8 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): F6@4.9Å(now 9.5,conf 0.35), K29@5.2Å(now 7.8,conf 0.26), K32@5.8Å(now 9.9,conf 0.22)
  - Q25↔F6: targets 4.7/4.9Å but partners are 14.5Å apart → too_far_apart by 4.9Å
  - L20↔F6: targets 4.7/4.9Å but partners are 14.0Å apart → too_far_apart by 4.5Å
  - K24↔F6: targets 5.3/4.9Å but partners are 13.5Å apart → too_far_apart by 3.3Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=17 · 3-10(G)=3 · coil(C)=1

```
CHHHEHHEEEHEGEHEEEHEEEHEHHHGGHEEEE
```

## Backbone H-bond Network

- total=55 · helix(i→i+4)=8 · sheet=47
  - S2 ↔ F6  (helix)
  - D3 ↔ K7  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - W23 ↔ N27  (helix)
  - Q26 ↔ K30  (helix)
  - D5 ↔ F10  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ R14  (sheet)
  - D5 ↔ A16  (sheet)
  - A8 ↔ R14  (sheet)
  - A8 ↔ A16  (sheet)
  - A8 ↔ F17  (sheet)
  - V9 ↔ R14  (sheet)
  - V9 ↔ A16  (sheet)
  - V9 ↔ F17  (sheet)
  - V9 ↔ A18  (sheet)
  - F10 ↔ A16  (sheet)
  - … +35 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=144 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=56 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.2797 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
