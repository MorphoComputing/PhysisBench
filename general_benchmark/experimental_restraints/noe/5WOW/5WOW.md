# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\experimental_restraints\noe\5WOW\seeds\seed_1\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 5.178 A
- tm_score_ca_ordered: 0.21425818275851158
- heavy_atom_rmsd: 5.589 A
- sidechain_heavy_atom_rmsd: 5.995 A
- **all-atom quality (honest):** heavy 5.589 A, sidechain 5.995 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 27
- bin_accuracy: 0.370

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** R9-R12 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.054), conflicts/hub=1.5, max_incompat=2.63Å, chain_span=0.135
- **fix-first:** [LOW_CONFLICT] Root cause(s): R9-R12 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y27** — severity 2.03, 2 conflict(s); suspect input ~`R9` (group: pull_in)
  - pull-in (wants closer): R23@3.8Å(now 7.5,conf 0.58)
  - R23↔R9: targets 3.8/4.1Å but partners are 10.6Å apart → too_far_apart by 2.6Å
  - R23↔C10: targets 3.8/4.2Å but partners are 10.1Å apart → too_far_apart by 2.1Å
- **C22** — severity 0.40, 1 conflict(s); suspect input ~`R12` (group: pull_in)
  - pull-in (wants closer): D13@4.1Å(now 6.7,conf 0.43), R12@5.4Å(now 8.9,conf 0.24)
  - G29↔R12: targets 4.5/5.4Å but partners are 11.6Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=11 · 3-10(G)=3 · coil(C)=0

```
EHHEHEHHGHHHEEHHHHHHHHHHHHGEHEEEGHEHE
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=12 · sheet=19
  - C3 ↔ L7  (helix)
  - L7 ↔ R11  (helix)
  - Q8 ↔ R12  (helix)
  - R11 ↔ D15  (helix)
  - R12 ↔ C16  (helix)
  - D15 ↔ A19  (helix)
  - C16 ↔ C20  (helix)
  - G18 ↔ C22  (helix)
  - A19 ↔ R23  (helix)
  - C20 ↔ G24  (helix)
  - C22 ↔ G26  (helix)
  - N25 ↔ G29  (helix)
  - G1 ↔ I6  (sheet)
  - G1 ↔ D13  (sheet)
  - G1 ↔ S14  (sheet)
  - P4 ↔ D13  (sheet)
  - P4 ↔ S14  (sheet)
  - I6 ↔ D13  (sheet)
  - I6 ↔ S14  (sheet)
  - D13 ↔ C28  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=271 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=158 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8224 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`5WOW.ensemble.pdb`)
- RMSF mean=2.498Å max=4.743Å (per-residue in .per_residue.csv)
- most flexible residues: 21, 1, 36, 20, 33

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `5WOW.pae.csv`
- mean=1.373Å · max=7.56Å · AlphaFold-PAE analog (low block = rigid unit/domain)
