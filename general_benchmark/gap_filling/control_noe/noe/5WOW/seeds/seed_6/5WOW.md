# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\5WOW\seeds\seed_6\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.587 A
- tm_score_ca_ordered: 0.12789190459095856
- heavy_atom_rmsd: 8.028 A
- sidechain_heavy_atom_rmsd: 8.472 A
- **all-atom quality (honest):** heavy 8.028 A, sidechain 8.472 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 22
- distogram_pairs: 27
- bin_accuracy: 0.593

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.054), conflicts/hub=1.0, max_incompat=2.54Å, chain_span=0.054
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C22** — severity 0.99, 1 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): G29@4.5Å(now 7.6,conf 0.39)
  - D13↔G29: targets 4.1/4.5Å but partners are 11.2Å apart → too_far_apart by 2.5Å
- **C20** — severity 0.55, 1 conflict(s); suspect input ~`C16` (group: pull_in)
  - pull-in (wants closer): G29@4.9Å(now 7.8,conf 0.36)
  - G29↔C16: targets 4.9/5.0Å but partners are 12.0Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=6 · 3-10(G)=2 · coil(C)=1

```
CEHEGHHHHHHHHHHHHEHEHHHHHGHHEHHHHHHHE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=18 · sheet=7
  - C3 ↔ L7  (helix)
  - I6 ↔ C10  (helix)
  - L7 ↔ R11  (helix)
  - Q8 ↔ R12  (helix)
  - R9 ↔ D13  (helix)
  - C10 ↔ S14  (helix)
  - R11 ↔ D15  (helix)
  - R12 ↔ C16  (helix)
  - D13 ↔ P17  (helix)
  - D15 ↔ A19  (helix)
  - P17 ↔ I21  (helix)
  - I21 ↔ N25  (helix)
  - G24 ↔ C28  (helix)
  - Y27 ↔ P31  (helix)
  - C28 ↔ Y32  (helix)
  - Y30 ↔ V34  (helix)
  - P31 ↔ P35  (helix)
  - Y32 ↔ D36  (helix)
  - V2 ↔ G18  (sheet)
  - V2 ↔ C20  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=306 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=191 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2384 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=22 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
