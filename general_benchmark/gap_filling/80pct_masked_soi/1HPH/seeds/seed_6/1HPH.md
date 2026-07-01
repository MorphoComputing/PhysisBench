# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HPH\seeds\seed_6\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 3.556 A
- tm_score_ca_ordered: 0.38445612393959955
- heavy_atom_rmsd: 5.219 A
- sidechain_heavy_atom_rmsd: 6.212 A
- **all-atom quality (honest):** heavy 5.219 A, sidechain 6.212 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 235
- bin_accuracy: 0.677

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=12 rmsd=6.016842266649586 -> 3.9459901691667714 A
- topology_reconvergence: applied=True accepted=5/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.5560380676531484
- ga_delta_rmsd: -1.225000769741679  ga_fitness_mode: energy
- pre_local_rmsd: 3.556042075414395  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.029), conflicts/hub=1.0, max_incompat=1.56Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q28** — severity 0.82, 1 conflict(s); suspect input ~`A35` (group: pull_in)
  - pull-in (wants closer): A35@10.4Å(now 14.1,conf 0.52)
  - R24↔A35: targets 7.2/10.4Å but partners are 19.2Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=11 · 3-10(G)=5 · coil(C)=3

```
CEGGHEHGEHHHHHEEHEEHHHHHEHEGECHEHGC
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=6 · sheet=10
  - M7 ↔ G11  (helix)
  - L10 ↔ L14  (helix)
  - H13 ↔ M17  (helix)
  - M17 ↔ E21  (helix)
  - V20 ↔ R24  (helix)
  - W22 ↔ K26  (helix)
  - S2 ↔ N9  (sheet)
  - L6 ↔ N15  (sheet)
  - N9 ↔ N15  (sheet)
  - N9 ↔ E18  (sheet)
  - N9 ↔ R19  (sheet)
  - E18 ↔ K25  (sheet)
  - R19 ↔ K25  (sheet)
  - R19 ↔ L27  (sheet)
  - K25 ↔ N32  (sheet)
  - L27 ↔ N32  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=82 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5741 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
