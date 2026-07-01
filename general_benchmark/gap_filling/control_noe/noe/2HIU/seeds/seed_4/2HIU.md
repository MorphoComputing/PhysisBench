# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2HIU\seeds\seed_4\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 8.356 A
- tm_score_ca_ordered: 0.11489564498281664
- heavy_atom_rmsd: 9.700 A
- sidechain_heavy_atom_rmsd: 10.669 A
- **all-atom quality (honest):** heavy 9.700 A, sidechain 10.669 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 32
- distogram_pairs: 25
- bin_accuracy: 0.560

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.021), conflicts/hub=2.0, max_incompat=2.89Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y44** — severity 1.37, 2 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 8.4,conf 0.41)
  - C25↔H28: targets 4.3/5.1Å but partners are 12.3Å apart → too_far_apart by 2.9Å
  - C25↔S27: targets 4.3/4.5Å but partners are 10.4Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=13 · 3-10(G)=6 · coil(C)=1

```
CHEHHHHGGHGHHEHHHEHHEGHHHEGHHHEHGHHHHEHEHEEEHEE
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=14 · sheet=32
  - V2 ↔ C6  (helix)
  - C6 ↔ C10  (helix)
  - L12 ↔ E16  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - C19 ↔ H23  (helix)
  - V20 ↔ L24  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - H28 ↔ A32  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - C37 ↔ G41  (helix)
  - G41 ↔ T45  (helix)
  - E3 ↔ Q14  (sheet)
  - E3 ↔ Y18  (sheet)
  - E3 ↔ N21  (sheet)
  - Q14 ↔ N21  (sheet)
  - Q14 ↔ G26  (sheet)
  - Q14 ↔ E31  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=396 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=247 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3252 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=32 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
