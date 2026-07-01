# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe\1JRJ\seeds\seed_8\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.252 A
- tm_score_ca_ordered: 0.092344914457783
- heavy_atom_rmsd: 8.079 A
- sidechain_heavy_atom_rmsd: 8.766 A
- **all-atom quality (honest):** heavy 8.079 A, sidechain 8.766 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 47
- bin_accuracy: 0.617

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.054), conflicts/hub=1.0, max_incompat=1.89Å, chain_span=0.054
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W24** — severity 0.71, 1 conflict(s); suspect input ~`P30` (group: pull_in)
  - pull-in (wants closer): P30@5.3Å(now 8.2,conf 0.38)
  - F21↔P30: targets 5.0/5.3Å but partners are 12.3Å apart → too_far_apart by 1.9Å
- **I22** — severity 0.61, 1 conflict(s); suspect input ~`V18` (group: pull_in)
  - pull-in (wants closer): K26@6.1Å(now 8.7,conf 0.33)
  - V18↔K26: targets 6.1/6.1Å but partners are 14.1Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=9 · 3-10(G)=8 · coil(C)=1

```
CEGHHHGHHHHHHEGGHGHEHEHEEGEHHGHGHHHEE
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=8 · sheet=14
  - T4 ↔ D8  (helix)
  - F5 ↔ L9  (helix)
  - T6 ↔ S10  (helix)
  - L9 ↔ M13  (helix)
  - M13 ↔ A17  (helix)
  - A17 ↔ F21  (helix)
  - R19 ↔ E23  (helix)
  - S31 ↔ P35  (helix)
  - E14 ↔ L20  (sheet)
  - L20 ↔ L25  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - I22 ↔ N27  (sheet)
  - I22 ↔ P36  (sheet)
  - I22 ↔ P37  (sheet)
  - W24 ↔ P36  (sheet)
  - W24 ↔ P37  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=139 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=35 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3591 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
