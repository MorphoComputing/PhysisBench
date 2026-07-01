# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\fusion\disulfides+noe\5WOW\seeds\seed_1\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 5.060 A
- tm_score_ca_ordered: 0.15682331252716805
- heavy_atom_rmsd: 6.447 A
- sidechain_heavy_atom_rmsd: 7.761 A
- **all-atom quality (honest):** heavy 6.447 A, sidechain 7.761 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 30
- distogram_pairs: 30
- bin_accuracy: 0.333

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=2.0, max_incompat=3.0Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C22** — severity 1.67, 2 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): G29@4.5Å(now 8.8,conf 0.39)
  - D13↔G29: targets 4.1/4.5Å but partners are 11.7Å apart → too_far_apart by 3.0Å
  - G29↔R12: targets 4.5/5.4Å but partners are 11.9Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=4 · 3-10(G)=3 · coil(C)=0

```
EHHGHHHEHHEHHHHHHHHHHHGHHHHGHHHHHHHHE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=23 · sheet=2
  - V2 ↔ I6  (helix)
  - C3 ↔ L7  (helix)
  - K5 ↔ R9  (helix)
  - I6 ↔ C10  (helix)
  - R9 ↔ D13  (helix)
  - C10 ↔ S14  (helix)
  - R12 ↔ C16  (helix)
  - D13 ↔ P17  (helix)
  - S14 ↔ G18  (helix)
  - D15 ↔ A19  (helix)
  - C16 ↔ C20  (helix)
  - P17 ↔ I21  (helix)
  - G18 ↔ C22  (helix)
  - C20 ↔ G24  (helix)
  - I21 ↔ N25  (helix)
  - C22 ↔ G26  (helix)
  - N25 ↔ G29  (helix)
  - G26 ↔ Y30  (helix)
  - Y27 ↔ P31  (helix)
  - G29 ↔ D33  (helix)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=331 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=215 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5815 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=30 (steric clashes)
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
- RMSF mean=2.314Å max=4.458Å (per-residue in .per_residue.csv)
- most flexible residues: 18, 10, 20, 33, 14

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `5WOW.pae.csv`
- mean=1.178Å · max=4.569Å · AlphaFold-PAE analog (low block = rigid unit/domain)
