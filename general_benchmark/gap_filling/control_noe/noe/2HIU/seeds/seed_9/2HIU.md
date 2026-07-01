# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2HIU\seeds\seed_9\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.158 A
- tm_score_ca_ordered: 0.14477537496269083
- heavy_atom_rmsd: 8.720 A
- sidechain_heavy_atom_rmsd: 10.108 A
- **all-atom quality (honest):** heavy 8.720 A, sidechain 10.108 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 29
- distogram_pairs: 25
- bin_accuracy: 0.280

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.021), conflicts/hub=2.0, max_incompat=3.31Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y44** — severity 1.94, 2 conflict(s); suspect input ~`S27` (group: pull_in)
  - pull-in (wants closer): S27@4.5Å(now 9.0,conf 0.39), H28@5.1Å(now 11.1,conf 0.27)
  - C25↔S27: targets 4.3/4.5Å but partners are 12.2Å apart → too_far_apart by 3.3Å
  - C25↔H28: targets 4.3/5.1Å but partners are 11.9Å apart → too_far_apart by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=5 · 3-10(G)=3 · coil(C)=2

```
CCEHHHHHHHHHHHEHHEHHGHHHHEHHHHHHHHHHHHGHHHGHHHE
```

## Backbone H-bond Network

- total=29 · helix(i→i+4)=25 · sheet=4
  - Q4 ↔ S8  (helix)
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - T7 ↔ S11  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - C10 ↔ Q14  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - E16 ↔ V20  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L33 ↔ C37  (helix)
  - V36 ↔ R40  (helix)
  - … +9 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=402 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=266 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1739 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=29 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
