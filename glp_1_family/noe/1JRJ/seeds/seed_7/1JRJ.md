# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe\1JRJ\seeds\seed_7\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.826 A
- tm_score_ca_ordered: 0.12746690851670653
- heavy_atom_rmsd: 7.788 A
- sidechain_heavy_atom_rmsd: 8.855 A
- **all-atom quality (honest):** heavy 7.788 A, sidechain 8.855 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 90
- bin_accuracy: 0.500

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q12-L25 → 71 conflicts (100%)
- explained: 71/71 conflicts by 1 root cause(s)
- metrics: hubs=14 (frac 0.378), conflicts/hub=5.1, max_incompat=7.65Å, chain_span=0.405
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q12-L25 — explain ~71/71 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 12.72, 8 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): M13@5.4Å(now 9.9,conf 0.37), Q12@6.1Å(now 10.6,conf 0.33)
  - Q12↔L20: targets 6.1/6.1Å but partners are 19.0Å apart → too_far_apart by 6.7Å
  - M13↔L20: targets 5.4/6.1Å but partners are 18.1Å apart → too_far_apart by 6.5Å
  - A17↔M13: targets 3.8/5.4Å but partners are 14.3Å apart → too_far_apart by 5.1Å
- **E14** — severity 12.60, 8 conflict(s); suspect input ~`K11` (group: pull_in)
  - pull-in (wants closer): K11@5.4Å(now 8.4,conf 0.37), A17@5.4Å(now 10.7,conf 0.37), V18@6.1Å(now 9.8,conf 0.33)
  - K11↔A17: targets 5.4/5.4Å but partners are 18.5Å apart → too_far_apart by 7.7Å
  - K11↔V18: targets 5.4/6.1Å but partners are 18.1Å apart → too_far_apart by 6.6Å
  - M13↔A17: targets 3.8/5.4Å but partners are 14.3Å apart → too_far_apart by 5.1Å
- **E15** — severity 8.58, 5 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): A17@5.4Å(now 8.4,conf 0.75), V18@5.0Å(now 8.3,conf 0.40)
  - A17↔M13: targets 5.4/5.4Å but partners are 14.3Å apart → too_far_apart by 3.4Å
  - Q12↔V18: targets 5.0/5.0Å but partners are 15.0Å apart → too_far_apart by 4.9Å
  - A17↔Q12: targets 5.4/5.0Å but partners are 15.1Å apart → too_far_apart by 4.6Å
- **I22** — severity 8.34, 7 conflict(s); suspect input ~`K26` (group: pull_in)
  - pull-in (wants closer): L25@5.0Å(now 8.3,conf 0.40), K26@6.1Å(now 9.4,conf 0.33)
  - R19↔L25: targets 5.0/5.0Å but partners are 15.3Å apart → too_far_apart by 5.2Å
  - R19↔K26: targets 5.0/6.1Å but partners are 16.7Å apart → too_far_apart by 5.5Å
  - L25↔V18: targets 5.0/6.1Å but partners are 15.2Å apart → too_far_apart by 4.1Å
- **V18** — severity 7.37, 6 conflict(s); suspect input ~`E14` (group: pull_in)
  - pull-in (wants closer): E15@5.0Å(now 8.3,conf 0.40), E14@6.1Å(now 9.8,conf 0.33)
  - E14↔I22: targets 6.1/6.1Å but partners are 16.9Å apart → too_far_apart by 4.7Å
  - F21↔E14: targets 5.0/6.1Å but partners are 15.8Å apart → too_far_apart by 4.6Å
  - E15↔F21: targets 5.0/5.0Å but partners are 13.6Å apart → too_far_apart by 3.5Å
- **W24** — severity 7.29, 6 conflict(s); suspect input ~`P30` (group: push_out)
  - pull-in (wants closer): F21@5.0Å(now 9.0,conf 0.40), P30@5.3Å(now 9.0,conf 0.38)
  - push-out (wants farther): G29@6.1Å(now 3.5,conf 0.33), P37@7.2Å(now 3.2,conf 0.21)
  - F21↔P30: targets 5.0/5.3Å but partners are 16.5Å apart → too_far_apart by 6.2Å
  - F21↔N27: targets 5.0/5.4Å but partners are 14.8Å apart → too_far_apart by 4.3Å
  - I22↔P30: targets 5.4/5.3Å but partners are 14.4Å apart → too_far_apart by 3.6Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=13 · 3-10(G)=3 · coil(C)=1

```
EEHHCHGGHHHHHEEEHHGHHEEHHEEHHEHHHEEHE
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=11 · sheet=20
  - T6 ↔ S10  (helix)
  - L9 ↔ M13  (helix)
  - M13 ↔ A17  (helix)
  - A17 ↔ F21  (helix)
  - L20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - W24 ↔ G28  (helix)
  - L25 ↔ G29  (helix)
  - G28 ↔ S32  (helix)
  - G29 ↔ G33  (helix)
  - S32 ↔ P36  (helix)
  - G1 ↔ E15  (sheet)
  - G1 ↔ E16  (sheet)
  - E2 ↔ E15  (sheet)
  - E16 ↔ I22  (sheet)
  - I22 ↔ N27  (sheet)
  - I22 ↔ A34  (sheet)
  - I22 ↔ P35  (sheet)
  - I22 ↔ P37  (sheet)
  - E23 ↔ P30  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=110 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=28 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1886 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
