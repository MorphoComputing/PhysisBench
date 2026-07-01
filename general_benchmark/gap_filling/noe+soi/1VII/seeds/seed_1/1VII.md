# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 3.594 A
- tm_score_ca_ordered: 0.26237860754449416
- heavy_atom_rmsd: 4.476 A
- sidechain_heavy_atom_rmsd: 5.127 A
- **all-atom quality (honest):** heavy 4.476 A, sidechain 5.127 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 161
- bin_accuracy: 0.559

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F10-R14 → 12 conflicts (52%); F6 → 5 conflicts (22%); L28-K29 → 5 conflicts (22%)
- explained: 22/23 conflicts by 3 root cause(s)
- metrics: hubs=6 (frac 0.176), conflicts/hub=3.8, max_incompat=5.19Å, chain_span=0.647
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F10-R14 + F6 + L28-K29 — explain ~22/23 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F6** — severity 6.55, 6 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): F17@4.9Å(now 7.7,conf 0.35), M12@5.5Å(now 8.9,conf 0.24)
  - S2↔F17: targets 4.0/4.9Å but partners are 13.5Å apart → too_far_apart by 4.6Å
  - L1↔F17: targets 4.7/4.9Å but partners are 13.1Å apart → too_far_apart by 3.6Å
  - S2↔M12: targets 4.0/5.5Å but partners are 14.7Å apart → too_far_apart by 5.2Å
- **R14** — severity 3.88, 4 conflict(s); suspect input ~`L1` (group: pull_in)
  - pull-in (wants closer): L1@5.2Å(now 11.0,conf 0.26)
  - N19↔L1: targets 9.9/5.2Å but partners are 20.2Å apart → too_far_apart by 5.0Å
  - F17↔L1: targets 4.0/5.2Å but partners are 13.1Å apart → too_far_apart by 3.9Å
  - A18↔L1: targets 8.7/5.2Å but partners are 17.4Å apart → too_far_apart by 3.5Å
- **F10** — severity 3.17, 4 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): L34@8.8Å(now 11.3,conf 0.52), K29@4.9Å(now 8.5,conf 0.35)
  - A16↔L34: targets 7.4/8.8Å but partners are 18.4Å apart → too_far_apart by 2.2Å
  - K29↔L1: targets 4.9/5.2Å but partners are 12.8Å apart → too_far_apart by 2.7Å
  - K7↔K29: targets 7.0/4.9Å but partners are 13.9Å apart → too_far_apart by 2.0Å
- **L28** — severity 2.74, 4 conflict(s); suspect input ~`L20` (group: pull_in)
  - pull-in (wants closer): L20@5.2Å(now 8.0,conf 0.26)
  - L34↔L20: targets 9.5/5.2Å but partners are 18.4Å apart → too_far_apart by 3.7Å
  - G33↔L20: targets 6.0/5.2Å but partners are 14.0Å apart → too_far_apart by 2.8Å
  - E31↔L20: targets 4.3/5.2Å but partners are 11.8Å apart → too_far_apart by 2.3Å
- **F17** — severity 2.69, 3 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): F6@4.9Å(now 7.7,conf 0.35), K29@5.2Å(now 8.0,conf 0.26)
  - Q25↔F6: targets 4.7/4.9Å but partners are 12.8Å apart → too_far_apart by 3.2Å
  - L20↔F6: targets 4.7/4.9Å but partners are 12.7Å apart → too_far_apart by 3.1Å
  - M12↔K29: targets 4.7/5.2Å but partners are 11.6Å apart → too_far_apart by 1.7Å
- **Q25** — severity 1.99, 2 conflict(s); suspect input ~`A18` (group: pull_in)
  - pull-in (wants closer): P21@3.8Å(now 6.4,conf 0.69), A18@4.9Å(now 8.5,conf 0.35)
  - K30↔A18: targets 5.1/4.9Å but partners are 14.6Å apart → too_far_apart by 4.6Å
  - A18↔K29: targets 4.9/5.8Å but partners are 12.3Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=10 · 3-10(G)=5 · coil(C)=2

```
EEHHEHHGHEGHEHHHHGGEGHHEHHHHCHEEEC
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=3 · sheet=16
  - D3 ↔ K7  (helix)
  - M12 ↔ A16  (helix)
  - W23 ↔ N27  (helix)
  - L1 ↔ F10  (sheet)
  - S2 ↔ F10  (sheet)
  - S2 ↔ T13  (sheet)
  - D5 ↔ F10  (sheet)
  - D5 ↔ T13  (sheet)
  - F10 ↔ L20  (sheet)
  - F10 ↔ K24  (sheet)
  - T13 ↔ L20  (sheet)
  - T13 ↔ K24  (sheet)
  - T13 ↔ K32  (sheet)
  - T13 ↔ G33  (sheet)
  - L20 ↔ E31  (sheet)
  - L20 ↔ K32  (sheet)
  - K24 ↔ E31  (sheet)
  - K24 ↔ K32  (sheet)
  - K24 ↔ G33  (sheet)

## Solvent Accessibility (burial)

- buried=11 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=144 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=48 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.345 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
