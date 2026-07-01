# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1VII\seeds\seed_4\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 5.292 A
- tm_score_ca_ordered: 0.14906991341758447
- heavy_atom_rmsd: 6.152 A
- sidechain_heavy_atom_rmsd: 6.866 A
- **all-atom quality (honest):** heavy 6.152 A, sidechain 6.866 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 162
- bin_accuracy: 0.432

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F17 → 31 conflicts (52%); F10-M12 → 20 conflicts (34%)
- explained: 51/59 conflicts by 2 root cause(s)
- metrics: hubs=12 (frac 0.353), conflicts/hub=4.9, max_incompat=8.31Å, chain_span=0.794
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F17 + F10-M12 — explain ~51/59 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 45.75, 28 conflict(s); suspect input ~`M12` (group: pull_in)
  - pull-in (wants closer): G11@6.3Å(now 10.9,conf 0.69), R14@4.0Å(now 7.7,conf 0.45), M12@4.7Å(now 10.3,conf 0.38), T13@4.7Å(now 9.0,conf 0.38), K29@5.2Å(now 7.9,conf 0.26)
  - W23↔R14: targets 8.5/4.0Å but partners are 18.3Å apart → too_far_apart by 5.8Å
  - M12↔L28: targets 4.7/4.9Å but partners are 16.3Å apart → too_far_apart by 6.8Å
  - W23↔M12: targets 8.5/4.7Å but partners are 19.5Å apart → too_far_apart by 6.3Å
- **F10** — severity 10.57, 10 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): D3@9.0Å(now 11.5,conf 0.67), K29@4.9Å(now 12.4,conf 0.35), L28@5.5Å(now 10.3,conf 0.24)
  - T13↔K29: targets 6.3/4.9Å but partners are 16.9Å apart → too_far_apart by 5.7Å
  - D3↔K29: targets 9.0/4.9Å but partners are 19.5Å apart → too_far_apart by 5.6Å
  - K29↔R14: targets 4.9/5.2Å but partners are 14.9Å apart → too_far_apart by 4.8Å
- **A18** — severity 7.51, 5 conflict(s); suspect input ~`M12` (group: pull_in)
  - pull-in (wants closer): M12@6.4Å(now 9.2,conf 0.59), Q25@4.9Å(now 9.0,conf 0.35)
  - K24↔M12: targets 7.8/6.4Å but partners are 18.3Å apart → too_far_apart by 4.1Å
  - W23↔M12: targets 9.8/6.4Å but partners are 19.5Å apart → too_far_apart by 3.3Å
  - M12↔Q25: targets 6.4/4.9Å but partners are 15.4Å apart → too_far_apart by 4.1Å
- **Q25** — severity 3.77, 2 conflict(s); suspect input ~`K30` (group: push_out)
  - pull-in (wants closer): N19@5.6Å(now 8.7,conf 0.69), A18@4.9Å(now 9.0,conf 0.35)
  - push-out (wants farther): K32@7.6Å(now 4.3,conf 0.69)
  - N19↔K30: targets 5.6/6.3Å but partners are 15.5Å apart → too_far_apart by 3.6Å
  - K30↔A18: targets 6.3/4.9Å but partners are 15.0Å apart → too_far_apart by 3.8Å
- **A16** — severity 3.70, 3 conflict(s); suspect input ~`W23` (group: push_out)
  - pull-in (wants closer): L22@9.7Å(now 13.7,conf 0.43), W23@10.6Å(now 16.1,conf 0.34)
  - push-out (wants farther): V9@5.8Å(now 3.2,conf 0.67)
  - M12↔W23: targets 4.7/10.6Å but partners are 19.5Å apart → too_far_apart by 4.3Å
  - T13↔W23: targets 4.3/10.6Å but partners are 18.5Å apart → too_far_apart by 3.6Å
  - L22↔M12: targets 9.7/4.7Å but partners are 17.1Å apart → too_far_apart by 2.7Å
- **F6** — severity 2.54, 3 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): D3@4.0Å(now 8.1,conf 0.45)
  - D3↔F17: targets 4.0/4.9Å but partners are 12.3Å apart → too_far_apart by 3.4Å
  - D3↔V9: targets 4.0/4.3Å but partners are 10.5Å apart → too_far_apart by 2.1Å
  - D3↔F10: targets 4.0/5.5Å but partners are 11.5Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=13 · 3-10(G)=2 · coil(C)=3

```
CEEHEHHHHEHHEEGEGEHHHHHEHEHHCHEEEC
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=4 · sheet=36
  - K7 ↔ G11  (helix)
  - N19 ↔ W23  (helix)
  - P21 ↔ Q25  (helix)
  - W23 ↔ N27  (helix)
  - S2 ↔ F10  (sheet)
  - S2 ↔ T13  (sheet)
  - S2 ↔ R14  (sheet)
  - S2 ↔ A16  (sheet)
  - S2 ↔ A18  (sheet)
  - D3 ↔ F10  (sheet)
  - D3 ↔ T13  (sheet)
  - D3 ↔ R14  (sheet)
  - D3 ↔ A16  (sheet)
  - D5 ↔ F10  (sheet)
  - D5 ↔ T13  (sheet)
  - D5 ↔ R14  (sheet)
  - D5 ↔ A16  (sheet)
  - D5 ↔ A18  (sheet)
  - F10 ↔ A16  (sheet)
  - F10 ↔ A18  (sheet)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=178 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=100 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.9069 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
