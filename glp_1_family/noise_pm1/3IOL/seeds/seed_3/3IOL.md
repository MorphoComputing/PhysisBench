# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm1\3IOL\seeds\seed_3\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.861 A
- tm_score_ca_ordered: 0.2397425648062738
- heavy_atom_rmsd: 4.673 A
- sidechain_heavy_atom_rmsd: 5.890 A
- **all-atom quality (honest):** heavy 4.673 A, sidechain 5.890 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 274
- bin_accuracy: 0.704

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.042), conflicts/hub=1.0, max_incompat=2.1Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I19** — severity 0.93, 1 conflict(s); suspect input ~`K24` (group: push_out)
  - push-out (wants farther): K24@9.8Å(now 6.7,conf 0.44)
  - L22↔K24: targets 5.4/9.8Å but partners are 2.4Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=3 · 3-10(G)=2 · coil(C)=1

```
CHEHEHGHHHHHHHHHHHHHGHHE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=12 · sheet=0
  - F2 ↔ V6  (helix)
  - S4 ↔ S8  (helix)
  - S8 ↔ G12  (helix)
  - Y9 ↔ Q13  (helix)
  - E11 ↔ A15  (helix)
  - G12 ↔ K16  (helix)
  - Q13 ↔ E17  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - K16 ↔ A20  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)

## Solvent Accessibility (burial)

- buried=10 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=71 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0439 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
