# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm1\3IOL\seeds\seed_2\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.301 A
- tm_score_ca_ordered: 0.21904376967689254
- heavy_atom_rmsd: 4.618 A
- sidechain_heavy_atom_rmsd: 5.968 A
- **all-atom quality (honest):** heavy 4.618 A, sidechain 5.968 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 231
- bin_accuracy: 0.636

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L10 → 9 conflicts (69%); S7 → 4 conflicts (31%)
- explained: 13/13 conflicts by 2 root cause(s)
- metrics: hubs=4 (frac 0.167), conflicts/hub=3.2, max_incompat=3.58Å, chain_span=0.625
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L10 + S7 — explain ~13/13 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L10** — severity 5.35, 6 conflict(s); suspect input ~`E17` (group: pull_in)
  - pull-in (wants closer): E17@9.3Å(now 12.2,conf 0.45)
  - T3↔E17: targets 10.3/9.3Å but partners are 22.1Å apart → too_far_apart by 2.4Å
  - I19↔E17: targets 14.2/9.3Å but partners are 2.7Å apart → too_close_together by 2.2Å
  - F2↔E17: targets 12.1/9.3Å but partners are 23.6Å apart → too_far_apart by 2.1Å
- **L22** — severity 3.73, 3 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@21.1Å(now 23.9,conf 0.53)
  - T3↔S7: targets 31.1/21.1Å but partners are 6.4Å apart → too_close_together by 3.6Å
  - T1↔S7: targets 31.7/21.1Å but partners are 8.6Å apart → too_close_together by 2.0Å
  - F2↔S7: targets 30.4/21.1Å but partners are 7.7Å apart → too_close_together by 1.5Å
- **E17** — severity 2.46, 3 conflict(s); suspect input ~`L10` (group: pull_in)
  - pull-in (wants closer): L10@9.3Å(now 12.2,conf 0.45)
  - S7↔L10: targets 16.5/9.3Å but partners are 5.2Å apart → too_close_together by 2.0Å
  - W21↔L10: targets 6.2/9.3Å but partners are 17.5Å apart → too_far_apart by 1.9Å
  - L10↔S8: targets 9.3/15.5Å but partners are 4.5Å apart → too_close_together by 1.6Å
- **S7** — severity 1.53, 1 conflict(s); suspect input ~`T3` (group: pull_in)
  - pull-in (wants closer): L22@21.1Å(now 23.9,conf 0.53)
  - L22↔T3: targets 21.1/5.6Å but partners are 29.6Å apart → too_far_apart by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=7 · 3-10(G)=2 · coil(C)=1

```
CHEHEHEHHEHHHHHEGHHEGHHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=6 · sheet=3
  - F2 ↔ V6  (helix)
  - S4 ↔ S8  (helix)
  - Y9 ↔ Q13  (helix)
  - A14 ↔ F18  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)
  - T3 ↔ L10  (sheet)
  - D5 ↔ L10  (sheet)
  - L10 ↔ K16  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=63 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0794 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
