# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1JRJ\seeds\seed_7\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.987 A
- tm_score_ca_ordered: 0.265655253614299
- heavy_atom_rmsd: 5.546 A
- sidechain_heavy_atom_rmsd: 6.949 A
- **all-atom quality (honest):** heavy 5.546 A, sidechain 6.949 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 276
- bin_accuracy: 0.812

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E23 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=3.0, max_incompat=3.43Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): E23 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E23** — severity 5.54, 3 conflict(s); suspect input ~`K26` (group: pull_in)
  - pull-in (wants closer): K26@5.1Å(now 9.0,conf 0.64)
  - K26↔E16: targets 5.1/10.9Å but partners are 19.4Å apart → too_far_apart by 3.4Å
  - G1↔K26: targets 38.0/5.1Å but partners are 46.1Å apart → too_far_apart by 3.0Å
  - A17↔K26: targets 9.0/5.1Å but partners are 16.4Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=19 · 3-10(G)=3 · coil(C)=0

```
EEEEHEHEGGGHHHEHEEHEHHHEEHEHHHHEEEEEE
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=4 · sheet=33
  - Q12 ↔ E16  (helix)
  - R19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - K26 ↔ P30  (helix)
  - G3 ↔ D8  (sheet)
  - D8 ↔ E15  (sheet)
  - E15 ↔ L20  (sheet)
  - A17 ↔ W24  (sheet)
  - A17 ↔ P36  (sheet)
  - A17 ↔ P37  (sheet)
  - V18 ↔ W24  (sheet)
  - V18 ↔ L25  (sheet)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)
  - L20 ↔ L25  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ P35  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - W24 ↔ S32  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=101 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=17 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7865 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
